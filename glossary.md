# 用語集 / Glossary

Keep terminology consistent across `src/<target>.md` and `figures/*.<target>.txt`.
Change an entry here first, then search and replace in both places.

Style (ja): です・ます調. Half-width alphanumerics, no space between Japanese and Latin text (e.g. `4D.Vector型`).
Full-width `（）` and `：` in prose. Do not append redundant English glosses to borrowed words or
established technical terms, even on first occurrence. Add a parenthetical only when it provides useful
information, such as an acronym, file extension or example.

## 4D terms (from the official 4D Japanese documentation)

| English | 日本語 | Notes |
|---|---|---|
| entity / entity selection | エンティティ / エンティティセレクション | |
| datastore | データストア | |
| dataclass | データクラス | |
| attribute | 属性 | |
| computed attribute | 計算属性 | |
| collection | コレクション | |
| object | オブジェクト | |
| method | メソッド | |
| project method | プロジェクトメソッド | |
| function | 関数 | |
| class | クラス | |
| parameter | 引数 | |
| form | フォーム | |
| form object | フォームオブジェクト | |
| list box | リストボックス | |
| web area | Webエリア | |
| 4D Web Server | 4D Webサーバー | |
| worker | ワーカー | |
| process | プロセス | |
| query | クエリ | |
| formula | フォーミュラ | |
| component | コンポーネント | |

## Document-specific terms

| English | 日本語 | Notes |
|---|---|---|
| multilingual support | 多言語対応 | |
| localization | ローカライズ | 原語の英語を括弧で併記しない。 |
| user interface | ユーザーインターフェース | 原語の英語を括弧で併記しない。 |
| regional settings | 地域設定 | システムやアプリケーションの地域設定。 |
| Use regional system settings | リージョンシステム設定を使う | 4D 20.8の日本語リソース`Internal Components/preferences.4dbase/Resources/ja.lproj/MotorJA.xlf`、グループ`Methods`、id `168`、resname `MethodsLanguageOption`で照合。元の図のビルド・フォントは未確認。 |
| language certification matrix | 言語対応表 | 編集者指定。[4D日本語サイトの表記](https://jp.4d.com/resources/4d-21-lts)に合わせる。 |
| compatibility matrix | 動作環境 | 編集者指定。[4D日本語サイトの表記](https://jp.4d.com/resources/4d-21-lts)に合わせる。 |
| resource / resource management | リソース / リソース管理 | `Resources`というフォルダー名は翻訳しない。 |
| structure file | ストラクチャーファイル | `.4db`、`.4dc`は原文どおり。 |
| data file | データファイル | |
| database | データベース | |
| Project mode | プロジェクトモード | |
| method editor / code editor | メソッドエディター / コードエディター | |
| international mode | インターナショナルモード | `"English-US"`は原文の表記を維持。 |
| version control | バージョン管理 | |
| property list | プロパティリスト | |
| static text | スタティックテキスト | |
| Help Tips | ヘルプTips | |
| translation unit | 翻訳単位 | XML要素名`trans-unit`は翻訳しない。 |
| source language / target language | ソース言語 / ターゲット言語 | |
| identifier | 識別子 | `id`、`resname`などの属性名は翻訳しない。 |
| runtime | ランタイム | |
| active language / current language | 使用中の言語 / 現在の言語 | UIラベルは対応するリソースの訳語を優先。 |
| deployment | 配布 | 本文のアプリケーション配布の文脈。 |
| engined Client/Server | 組み込み版クライアント/サーバー | 原文の「engined」の解釈。編集者確認対象。 |
| remote client | リモートクライアント | |
| query editor | クエリエディター | |
| sort dialog | 並べ替えダイアログ | |
| Quick Reports editor | クイックレポートエディター | |
| system variable | システム変数 | `OK`は翻訳しない。 |
| blob | BLOB | |
| field / table | フィールド / テーブル | |
| Input Method Editor | 入力メソッドエディター | 必要に応じて略語`IME`を併記し、英語のフルスペルは重ねない。 |
| text comparison | テキスト比較 | 正式なUIラベルとの照合はスクリーンショット確認時に行う。 |
| Get Localized String / Get localized string | Get Localized String / Get localized string | 原文の表記を維持。`Get localized string`は20 R7より前のコマンド名。20 R7以降は`Localized string`。デモの互換性バージョン19 R8に合わせて旧名を維持する。本文のコードは変更しない。 |
| SET DATABASE LOCALIZATION | SET DATABASE LOCALIZATION | コマンド名は翻訳しない。 |
| Get database localization | Get database localization | コマンド名は翻訳しない。 |
| ExcelArabic.txt / ExcelArabic1.txt | ExcelArabic.txt / ExcelArabic1.txt | 原文の本文とコードで名前が異なる。修正せず編集者確認対象とする。 |
| Unicode Text / UTF-8 | Unicodeテキスト / UTF-8 | 原文の保存形式と読み込み時の文字コードの整合性は編集者確認対象。 |

## Proper nouns in examples

| English | 日本語 | Notes |
|---|---|---|
| 4D | 4D | 製品名。 |
| Multilingual Support in 4D Databases with XLIFF Integration | XLIFFを活用した4Dデータベースの多言語対応 | 表題の訳。 |
| Karim MEGHRAOUI | Karim MEGHRAOUI | 著者名は原綴り。 |
| 4D Morocco | 4D Morocco | 所属名は原綴り。 |
| Technical Note 24-11 | テクニカルノート24-11 | 原文の文書番号。 |
| Apple / macOS / Mac / Windows | Apple / macOS / Mac / Windows | 製品・企業名は原綴り。 |
| Unicode / XLIFF / XML / OASIS | Unicode / XLIFF / XML / OASIS | 規格名・団体名は原綴り。 |
| Organization for the Advancement of Structured Information Standards | Organization for the Advancement of Structured Information Standards | OASISの正式名称は原綴り。 |
| MeCab / Excel | MeCab / Excel | ライブラリ名・製品名は原綴り。MeCabの同梱・除外に関する原文の説明は4D v19 R5当時のもの。MeCabは20 R10、内蔵PHPインタープリターは20 R3で削除され、4D 21には含まれない。[公式リリースノート](https://developer.4d.com/docs/21/Notes/updates)を参照。本文では過去形と訳注で区別し、図12には編集者提供の現行画面を使用する。 |
| English / French / Spanish / German | 英語 / フランス語 / スペイン語 / ドイツ語 | 言語コードとサンプル値は原文どおり。 |
| Japanese / Chinese / Arabic | 日本語 / 中国語 / アラビア語 | サンプルデータは置き換えない。 |
| Italian / Portuguese | イタリア語 / ポルトガル語 | |
| Monday / Tuesday / January | Monday / Tuesday / January | XLIFFのソース値として原綴りを維持。 |
| Lunes / Martes / Enero | Lunes / Martes / Enero | スペイン語の翻訳例として原綴りを維持。 |
| LangageSwitching | LangageSwitching | デモの既存プロジェクト名。綴りは修正しない。 |

## Demo localisation notes

- 画面見出しや操作ラベルは`Resources/ja.lproj/LangageSwitchingJA.xlf`を日本語スクリーンショットの照合元とする。数、曜日、旧暦の月名、アクション名など、既存の多言語サンプル値は変更しない。
- デモの説明画面で逆になっていた`SET DATABASE LOCALIZATION`のコンポーネントへの適用範囲を修正した。`*`なしはデータベースとコンポーネント、`*`ありは呼び出し元のデータベースのみ。英語ソースも同時に修正した。参照：https://developer.4d.com/docs/commands/set-database-localization
- 実際の`ExcelArabic1.txt`はUTF-16LE（BOM付き）。デモでは内容を変えずに`Resources/`に移し、UTF-16で読み込む。保存するBLOBは元のバイト列を維持し、画面表示用テキストだけ改行をCRに統一する。本文の原文由来のUTF-8コード例は変更していないため、デモとの差異は編集者確認対象。
