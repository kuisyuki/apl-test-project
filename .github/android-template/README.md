# Android Template

このディレクトリは、Androidアプリプロジェクトの最小構成テンプレートです。

## ディレクトリ構成

```
android-template/
├── build.gradle
├── settings.gradle
├── gradle.properties
├── app/
│   ├── build.gradle
│   └── src/
│       └── main/
│           ├── AndroidManifest.xml
│           ├── kotlin/
│           │   └── com/
│           │       └── example/
│           │           └── androidtest/
│           │               └── MainActivity.kt
│           ├── res/
│           │   ├── layout/
│           │   │   └── activity_main.xml
│           │   ├── values/
│           │   │   └── strings.xml
│           │   └── mipmap-anydpi-v26/
│           │       ├── ic_launcher.xml
│           │       └── ic_launcher_round.xml
```

## 必要なファイル一覧

- `build.gradle` : プロジェクトのビルド設定
- `settings.gradle` : モジュールの定義
- `gradle.properties` : プロパティ設定
- `app/build.gradle` : アプリモジュールのビルド設定
- `app/src/main/AndroidManifest.xml` : マニフェストファイル
- `app/src/main/kotlin/com/example/androidtest/MainActivity.kt` : メインアクティビティ
- `app/src/main/res/layout/activity_main.xml` : レイアウトファイル
- `app/src/main/res/values/strings.xml` : 文字列リソース
- `app/src/main/res/mipmap-anydpi-v26/ic_launcher.xml` : アプリアイコン
- `app/src/main/res/mipmap-anydpi-v26/ic_launcher_round.xml` : ラウンドアイコン

## 備考
- パッケージ名やアプリ名はプロジェクトごとに適宜変更してください。
- 追加のリソースや設定が必要な場合は、このテンプレートを拡張してご利用ください。 