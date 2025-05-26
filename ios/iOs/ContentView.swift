//
//  ContentView.swift
//  iOs
//
//  Created by en-yuki.seto on 2025/05/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    @State private var lifecycleHistory: String = ""
    @State private var showLifecycleToast = false
    @State private var showHelloToast = false
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home, coupon, card, save, use
    }
    
    func showLifecycle(_ status: String) {
        if lifecycleHistory.isEmpty {
            lifecycleHistory = status
        } else {
            lifecycleHistory += "\n" + status
        }
        showLifecycleToast = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showLifecycleToast = false
        }
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(lifecycleHistory: $lifecycleHistory, showHelloToast: $showHelloToast)
                .tabItem {
                    Image(systemName: "house")
                    Text("ホーム")
                }
                .tag(Tab.home)
            CouponView()
                .tabItem {
                    Image(systemName: "tag")
                    Text("クーポン")
                }
                .tag(Tab.coupon)
            CardView()
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("カード")
                }
                .tag(Tab.card)
            SaveView()
                .tabItem {
                    Image(systemName: "tray.and.arrow.down")
                    Text("ためる")
                }
                .tag(Tab.save)
            UseServiceView()
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("つかう")
                }
                .tag(Tab.use)
        }
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .active:
                showLifecycle("active (onResume)")
                print("onResume (active)")
            case .inactive:
                showLifecycle("inactive (onPause)")
                print("onPause (inactive)")
            case .background:
                showLifecycle("background (onStop)")
                print("onStop (background)")
            @unknown default:
                showLifecycle("unknown")
                print("unknown phase")
            }
        }
        .onAppear {
            showLifecycle("onCreate/onStart")
            print("onCreate/onStart")
        }
        .background(Color.white)
        .ignoresSafeArea()
        .overlay(
            Group {
                if showLifecycleToast {
                    VStack {
                        HStack {
                            Spacer()
                            Text(lifecycleHistory.components(separatedBy: "\n").last ?? "")
                                .foregroundColor(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                                .background(Color.black.opacity(0.8))
                                .cornerRadius(24)
                            Spacer()
                        }
                        .padding(.top, 60)
                        Spacer()
                    }
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .animation(.easeInOut, value: showLifecycleToast)
                }
                if showHelloToast {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Hello World")
                                .foregroundColor(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                                .background(Color.black.opacity(0.8))
                                .cornerRadius(24)
                            Spacer()
                        }
                        .padding(.bottom, 60)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.easeInOut, value: showHelloToast)
                }
            }
        )
    }
}

#Preview {
    ContentView()
}
