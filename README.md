# XLIFFを活用した4Dデータベースの多言語対応

*Multilingual Support in 4D Databases with XLIFF Integration* — 日本語版。

4Dアプリケーションの表示言語をXLIFFで切り替える方法を解説する、テクニカルノート24-11の日本語版です。
OSと4Dの言語設定、翻訳リソースの配置、フォームへのXLIFF参照の設定、アジアの言語やアラビア語の扱いを取り上げます。
付属デモでは、複数の言語の表示を比較しながら、リソースから文字列を取得する仕組みを確認できます。
2024年の原文とは区別して、4D 20から4D 21への移行に関する2026年10月の追補を収録しています。

## ダウンロード

| 配布物 | ファイル |
|---|---|
| 日本語版PDF | [24-11_MultilingualWithXLIFF_ja.pdf](https://github.com/miyako/MultilingualWithXLIFF/releases/latest/download/24-11_MultilingualWithXLIFF_ja.pdf) |
| 4Dデモ | [LangageSwitching.zip](https://github.com/miyako/MultilingualWithXLIFF/releases/latest/download/LangageSwitching.zip) |
| 英語原文 | [24-11_MultilingualWithXLIFF.pdf](document/24-11_MultilingualWithXLIFF.pdf) |

配布履歴は[GitHub Releases](https://github.com/miyako/MultilingualWithXLIFF/releases)を参照してください。

## デモ

`demo/LangageSwitching/Project/LangageSwitching.4DProject`を4Dで開きます。
ZIPを使用する場合も、展開した`LangageSwitching/Project/`内の同じファイルを開きます。

元デモの対象は4D 20.4または20 R5です。プロジェクトの互換性バージョン19 R8は変更していません。
この配布版は、macOS上の4D 21 R3およびtool4dで動作・コンパイルを確認しています。

起動時は日本語の操作ガイドを表示します。「デモ」をクリックして操作画面に進み、
言語を選んで「選択した言語で開く」をクリックします。
「全言語を別プロセスで開く」では、英語、スペイン語、フランス語、ドイツ語、イタリア語、日本語を比較できます。
メニューから再度開始した場合は、既存のウィンドウを前面に表示します。

翻訳リソースは`Resources/<言語>.lproj/`にあります。
日本語と英語の操作画面を整備し、ほかの4言語で未翻訳の操作ラベルは英語で補っています。
未翻訳箇所はXLIFFの`state="needs-translation"`で識別できます。
数、曜日、月名など、元の多言語サンプルは変更していません。

Webエリアで4Dサイトを表示するにはインターネット接続が必要です。
「アラビア語を読み込む」は、同梱の`Resources/ExcelArabic1.txt`を使用します。
データファイルは同梱していないため、初回起動時に新しいデータファイルを作成してください。
詳しい操作方法は[デモの説明](demo/LangageSwitching/readme.txt)を参照してください。

## 原文からの変更点

- 本文を日本語化し、プログラムコードは英語原文のまま維持しています。
- 図02、03、05、07、12に日本語の実画面キャプチャーを使用しています。その他の画像は原図のままです。
  原画像は保存し、差し替え画像と出典情報を`figures/`に分けています。
- 2026年10月の追補で、4D 20 LTSと20 R系の違い、MeCabと内蔵PHPの削除時期、
  外部PHPへの移行、4D 21でのインデックス再構築を説明しています。
  v20のビルド画面も比較用資料として保存しています。
- デモの日本語UIと起動処理を整備し、ウィンドウの重複起動を防ぐようにしています。
  言語設定の適用範囲に関する説明とWebエリアの参照も修正しています。
- アラビア語サンプルは内容を変えず、実ファイルのUTF-16LEに合わせて読み込むようにしています。
  本文の原文由来のコード例は変更していないため、この点はデモと異なります。

## 編集と再ビルド

PDFを直接編集せず、ソースを編集して再生成します。

| ファイル | 内容 |
|---|---|
| `src/ja.md` | 日本語本文。プログラムコードは変更しません。 |
| `src/en.md` | 英語原文の抽出結果。コードと構成の照合元です。 |
| `figures/fig-NN.png` | 保存された原画像。上書きしません。 |
| `figures/fig-NN-ja.png` | 日本語の差し替え画像。 |
| `figures/layout/fig-NN.json` | 配置情報。`replace`で差し替え画像を指定します。 |
| `figures/captures-ja.json` | キャプチャーの出典、ハッシュ、切り出し方法。 |
| `glossary.md` | 用語と表記の方針。 |

```sh
git submodule update --init .agents
make setup
make                 # 日本語版PDFをbuild/に生成
make check           # コードブロックと図の参照を照合
make review          # 原画像と差し替え画像の比較シートを生成
make release-assets  # PDFとコミット済みデモのZIPを生成
```

Python 3、Google ChromeまたはChromium、日本語フォントが必要です。
再抽出する場合のみTesseractも使用します。
`make demo-zip`はコミット済みファイルだけを使用し、実行時のデータや設定は含めません。

PDFの配布用ビルドはmacOSのヒラギノフォントを使用しています。
LinuxではNoto Sans CJKを使用するため、改行やページ配置が異なる場合があります。
詳しい手順は[ローカライズ用テンプレート](https://github.com/miyako/4d-technote-localisation-template)を参照してください。

## 原著

Karim MEGHRAOUI（4D Morocco、Technical Support Engineer）

テクニカルノート24-11、2024年。
