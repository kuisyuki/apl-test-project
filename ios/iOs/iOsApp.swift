//
//  iOsApp.swift
//  iOs
//
//  Created by en-yuki.seto on 2025/05/22.
//

import SwiftUI

@main
struct iOsApp: App {
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView(showSplash: $showSplash)
            } else {
                ContentView()
            }
        }
    }
}
