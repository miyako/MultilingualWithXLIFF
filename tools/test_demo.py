#!/usr/bin/env python3
"""Check demo resources; set TOOL4D to also compile and test a temporary database.

    python tools/test_demo.py
    TOOL4D=/path/to/tool4d python tools/test_demo.py
"""
import hashlib
import io
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch
import xml.etree.ElementTree as ET

import tool4d

ROOT = Path(__file__).resolve().parent.parent
DEMO = ROOT / "demo/LangageSwitching"
RESOURCES = DEMO / "Resources"
SOURCES = DEMO / "Project/Sources"
NS = {"x": "urn:oasis:names:tc:xliff:document:1.2"}
SAMPLE_DIGESTS = {
    "en": "8359e95d6829ea6465cc721295a5df79409dab364c6d5e18edda33760537106a",
    "ja": "849eb60b5fc9011a0ae24a3fc27dcbcc43c36e422e2375f939fe847cd0206cde",
    "es": "61b346921c8cb55658eeb3e1aec8487b049fb0474f5f01102b5606a4edcdc0f4",
    "fr": "020fd6d6b999e4bffc56c708e2ad00224985936237a3694f570f578c92c4d442",
    "de": "ec66fb954975b399b5631325b923cda0c45055ad438a5ff8481872cbc3a2a270",
    "it": "9b94b34a78ffe87bc9faf3c0e36429ad4d8a42a74b35fa66fd7f73b54150243d",
}
ARABIC_DIGEST = "d17a43650e8f1e989ec9c15d26831e5d1c904fb301a7135517d9285dd1989df6"
BUILTIN_IDS = {
    "CommonMenuFile", "CommonMenuEdit", "CommonMenuMode", "CommonMenuItemQuit",
    "CommonMenuItemUndo", "CommonMenuItemCut", "CommonMenuItemCopy",
    "CommonMenuItemPaste", "CommonMenuItemClear", "CommonMenuItemSelectAll",
    "CommonMenuItemShowClipboard", "CommonMenuItemDesign",
}


def units(language):
    result = {}
    for path in sorted((RESOURCES / f"{language}.lproj").glob("*.xlf")):
        root = ET.parse(path).getroot()
        assert root.tag == f"{{{NS['x']}}}xliff" and root.attrib["version"] == "1.2", path
        body = root.find("x:file/x:body", NS)
        assert body is not None, path
        for unit in body:
            assert unit.tag == f"{{{NS['x']}}}trans-unit", path
            key = unit.attrib["resname"]
            assert unit.attrib["id"] == key and key not in result, (path, key)
            assert not key.startswith("Common"), (path, key)
            source = unit.findtext("x:source", namespaces=NS)
            target = unit.findtext("x:target", namespaces=NS)
            assert source and target, (path, key)
            result[key] = (source, target)
    return result


def strings(value):
    if isinstance(value, str):
        yield value
    elif isinstance(value, dict):
        for child in value.values():
            yield from strings(child)
    elif isinstance(value, list):
        for child in value:
            yield from strings(child)


class DemoTests(unittest.TestCase):
    def test_resources_and_english_sources(self):
        english = units("en")
        self.assertTrue(english)
        for source, target in english.values():
            self.assertEqual(source, target)
        for language in SAMPLE_DIGESTS:
            with self.subTest(language=language):
                translated = units(language)
                self.assertEqual(english.keys(), translated.keys())
                for key, (source, _) in translated.items():
                    self.assertEqual(source, english[key][0], key)
                for path in (RESOURCES / f"{language}.lproj").glob("*.xlf"):
                    self.assertTrue(path.stem.endswith(language.upper()), path)

    def test_original_sample_values(self):
        for language, expected in SAMPLE_DIGESTS.items():
            with self.subTest(language=language):
                samples = {
                    key: target for key, (_, target) in units(language).items()
                    if key.startswith(("count_", "day_", "month_", "action_", "info_"))
                }
                self.assertEqual(len(samples), 33)
                digest = hashlib.sha256(json.dumps(
                    samples, sort_keys=True, ensure_ascii=False
                ).encode()).hexdigest()
                self.assertEqual(digest, expected)

    def test_reference_coverage(self):
        references = {"AlertArabicMissing", "AlertArabicRead", "AlertArabicSave"}
        for path in SOURCES.rglob("*"):
            if path.suffix in (".4DForm", ".json"):
                for value in strings(json.loads(path.read_text(encoding="utf-8"))):
                    if value.startswith(":xliff:"):
                        references.add(value.removeprefix(":xliff:"))
            elif path.suffix == ".4dm":
                references.update(re.findall(
                    r'Get localized string(?::C991)?\("([^"]+)"\)',
                    path.read_text(encoding="utf-8"),
                ))
        for language in SAMPLE_DIGESTS:
            self.assertFalse(references - BUILTIN_IDS - units(language).keys(), language)

    def test_form_method_wiring(self):
        for path in SOURCES.rglob("*.4DForm"):
            form = json.loads(path.read_text(encoding="utf-8"))
            if "method" in form:
                self.assertTrue((path.parent / form["method"]).is_file(), path)
            for page in form["pages"]:
                if not page:
                    continue
                for name, obj in page["objects"].items():
                    if "method" in obj:
                        self.assertTrue((path.parent / obj["method"]).is_file(), name)
                        self.assertTrue(obj.get("events"), name)
        intro = json.loads((SOURCES / "Forms/HDI/form.4DForm").read_text())
        button = intro["pages"][1]["objects"]["Button"]
        self.assertEqual(button["action"], "accept")
        self.assertIn("onClick", button["events"])
        self.assertIn("method", button)
        localized = json.loads((SOURCES / "Forms/Localized/form.4DForm").read_text())
        area = localized["pages"][1]["objects"]["WebArea_url"]
        self.assertNotEqual(area["dataSource"], area["urlSource"])
        self.assertEqual(area["urlSource"], "Form.url")

    def test_original_arabic_sample(self):
        sample = (RESOURCES / "ExcelArabic1.txt").read_bytes()
        self.assertEqual(hashlib.sha256(sample).hexdigest(), ARABIC_DIGEST)
        self.assertTrue(sample.startswith(b"\xff\xfe"))
        self.assertIn("\r\n", sample.decode("utf-16"))

    def test_runner_rejects_failed_process_even_with_an_artifact(self):
        def failed_process(command, **kwargs):
            project = next(arg.split("=", 1)[1] for arg in command if arg.startswith("--project="))
            (Path(project).parent.parent / "agent-test.txt").write_text("stale-looking success")
            return subprocess.CompletedProcess(command, 7, stdout="", stderr="expected failure")

        with patch.object(sys, "argv", ["tool4d.py", str(DEMO), "--compile"]), \
                patch.object(tool4d, "find_tool4d", return_value="/unused/tool4d"), \
                patch.object(tool4d.subprocess, "run", side_effect=failed_process), \
                patch.object(sys, "stderr", new=io.StringIO()), \
                self.assertRaises(SystemExit) as raised:
            tool4d.main()
        self.assertEqual(raised.exception.code, 7)

    @unittest.skipUnless(os.environ.get("TOOL4D"), "set TOOL4D for runtime checks")
    def test_runtime_resources_import_and_compile(self):
        keys = sorted(units("en"))
        key_arguments = "; \\\n\t".join(json.dumps(key) for key in keys)
        code = r'''var $out; $dictionary; $imported; $missing : Object
var $codes; $keys : Collection
var $code; $key; $value : Text
$out:=New object("locales"; New object)
$codes:=New collection("en-US"; "es"; "fr"; "de"; "it"; "ja")
$keys:=New collection(KEY_ARGUMENTS)
For each ($code; $codes)
    SET DATABASE LOCALIZATION($code; *)
    $dictionary:=New object
    For each ($key; $keys)
        $value:=Get localized string:C991($key)
        $dictionary[$key]:=$value
    End for each
    $out.locales[$code]:=$dictionary
End for each
SET DATABASE LOCALIZATION("ja"; *)
$out.languages:=DemoLanguages
$out.recordsBefore:=Records in table([Table_1])
$imported:=ImportArabic("/RESOURCES/ExcelArabic1.txt")
$out.imported:=$imported
$out.recordsAfter:=Records in table([Table_1])
$out.blobDigest:=Generate digest([Table_1]Champ_2; SHA256 digest)
$missing:=ImportArabic("/RESOURCES/missing-sample.txt")
$out.missing:=$missing
$out.recordsAfterMissing:=Records in table([Table_1])
File("/PACKAGE/agent-test.txt").setText(JSON Stringify($out))
QUIT 4D
'''.replace("KEY_ARGUMENTS", key_arguments)
        (ROOT / "build").mkdir(exist_ok=True)
        with tempfile.TemporaryDirectory(prefix="demo-tests-", dir=ROOT / "build") as tmp:
            method = Path(tmp) / "test.4dm"
            method.write_text(code, encoding="utf-8")
            result = subprocess.run(
                [sys.executable, str(ROOT / "tools/tool4d.py"), str(DEMO),
                 str(method), "--new-data"],
                check=True, capture_output=True, text=True, timeout=660,
            )
            actual = json.loads(result.stdout)
        for language in SAMPLE_DIGESTS:
            code = "en-US" if language == "en" else language
            expected = {key: target for key, (_, target) in units(language).items()}
            self.assertEqual(actual["locales"][code], expected, language)
        self.assertEqual(actual["languages"][5]["label"], "日本語（ja）")
        self.assertEqual([item["code"] for item in actual["languages"]],
                         ["en-US", "es", "fr", "de", "it", "ja"])
        sample_text = (RESOURCES / "ExcelArabic1.txt").read_bytes().decode("utf-16")
        self.assertEqual(actual["imported"], {
            "success": True, "text": sample_text.replace("\r\n", "\r")
        })
        self.assertEqual(actual["blobDigest"].lower(), ARABIC_DIGEST)
        self.assertEqual(actual["recordsBefore"], 0)
        self.assertEqual(actual["recordsAfter"], 1)
        self.assertEqual(actual["missing"], {
            "success": False, "errorKey": "AlertArabicMissing"
        })
        self.assertEqual(actual["recordsAfterMissing"], 1)
        compiled = subprocess.run(
            [sys.executable, str(ROOT / "tools/tool4d.py"), str(DEMO), "--compile"],
            check=True, capture_output=True, text=True, timeout=660,
        )
        result = json.loads(compiled.stdout)
        self.assertTrue(result["success"], result)
        self.assertFalse([error for error in result.get("errors", []) if error["isError"]])


if __name__ == "__main__":
    unittest.main()
