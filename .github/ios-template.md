# iOS Template

iOSアプリプロジェクトの最小構成テンプレートです。

## ディレクトリ構成

```
ios-template/
├── iOs.xcodeproj/
│   └── project.pbxproj
├── iOs/
│   ├── ContentView.swift
│   ├── iOsApp.swift
│   └── Assets.xcassets/
│       ├── AppIcon.appiconset/
│       │   └── Contents.json
│       └── AccentColor.colorset/
│           └── Contents.json
├── iOsTests/
│   └── iOsTests.swift
├── iOsUITests/
│   ├── iOsUITests.swift
│   └── iOsUITestsLaunchTests.swift
```

## 必要なファイル一覧

- `iOs.xcodeproj/project.pbxproj` : Xcodeプロジェクト設定ファイル
- `iOs/ContentView.swift` : メインUIのSwiftUIビュー
- `iOs/iOsApp.swift` : アプリのエントリーポイント
- `iOs/Assets.xcassets/AppIcon.appiconset/Contents.json` : アプリアイコン設定
- `iOs/Assets.xcassets/AccentColor.colorset/Contents.json` : アクセントカラー設定
- `iOsTests/iOsTests.swift` : 単体テストコード
- `iOsUITests/iOsUITests.swift` : UIテストコード
- `iOsUITests/iOsUITestsLaunchTests.swift` : UI起動テストコード

## 備考
- バンドルIDやアプリ名はプロジェクトごとに適宜変更してください。
- 追加のリソースや設定が必要な場合は、このテンプレートを拡張してご利用ください。 