//%attributes = {"invisible":true}
#DECLARE -> $languages : Collection

$languages:=New collection(\
	New object("code"; "en-US"; "label"; Get localized string:C991("LanguageEN")); \
	New object("code"; "es"; "label"; Get localized string:C991("LanguageES")); \
	New object("code"; "fr"; "label"; Get localized string:C991("LanguageFR")); \
	New object("code"; "de"; "label"; Get localized string:C991("LanguageDE")); \
	New object("code"; "it"; "label"; Get localized string:C991("LanguageIT")); \
	New object("code"; "ja"; "label"; Get localized string:C991("LanguageJA")))
