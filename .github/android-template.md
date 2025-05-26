# Android プロジェクト構成ガイド

Androidアプリの一般的なディレクトリ構成と、各ディレクトリにどのような用途のファイルを配置するかのガイドです。

## ディレクトリ構成と用途

```
android-project/
├── build.gradle, settings.gradle, gradle.properties
│   └─ プロジェクト全体のビルド・設定ファイル
├── app/
│   ├── build.gradle
│   │   └─ アプリモジュールのビルド設定
│   └── src/
│       └── main/
│           ├── AndroidManifest.xml
│           │   └─ アプリのマニフェスト（権限・アクティビティ定義など）
│           ├── kotlin/
│           │   └─ アプリのKotlinソースコード（パッケージごとにディレクトリ分割）
│           ├── java/
│           │   └─ Javaソースコード（Kotlinと同様、必要な場合のみ）
│           ├── res/
│           │   ├── layout/   ─ 画面レイアウトXML
│           │   ├── values/   ─ 文字列・色・スタイル等の定義
│           │   ├── drawable/ ─ 画像・アイコン等
│           │   ├── menu/     ─ メニュー定義
│           │   ├── mipmap/   ─ アプリアイコン
│           │   └── その他リソース
│           └── assets/ ─ アプリ内で利用する静的ファイル（必要に応じて）
│
├── gradle/ ─ Gradleラッパー関連
├── local.properties ─ 環境依存の設定
└── ...
```

## 備考
- パッケージ名やディレクトリ名はプロジェクトごとに調整してください。
- テストコードは `src/test/` や `src/androidTest/` に配置します。
- 追加のリソースや設定が必要な場合は、用途に応じてディレクトリを拡張してください。 