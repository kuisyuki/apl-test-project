//
//  ContentView.swift
//  iOs
//
//  Created by en-yuki.seto on 2025/05/22.
//

import SwiftUI

struct UseServiceView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("つかうサービス")
                .font(.title)
                .padding(.top, 40)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity, alignment: .center)
            Text("ゲームの課金につかう")
            Text("ポンタグッズや特典への交換につかう")
            Text("その他サービスにつかう")
            Spacer()
        }
        .padding(.horizontal)
        .background(Color.white)
    }
}

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
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    Group {
                        switch selectedTab {
                        case .home:
                            VStack {
                                Spacer()
                                Text(lifecycleHistory)
                                    .font(.title2)
                                    .foregroundColor(.orange)
                                    .padding()
                                    .multilineTextAlignment(.center)
                                Spacer()
                                Button("CLICK ME") {
                                    showHelloToast = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        showHelloToast = false
                                    }
                                }
                                .padding()
                                .background(Color(.systemGray5))
                                .cornerRadius(8)
                                .shadow(radius: 2)
                                Spacer()
                            }
                        case .coupon:
                            VStack {
                                Spacer()
                                Text("お店を選ぶ")
                                    .font(.title2)
                                Spacer()
                            }
                        case .card:
                            VStack {
                                Spacer()
                                Text("バーコードが表示されるエリア")
                                    .font(.title2)
                                Spacer()
                            }
                        case .save:
                            VStack {
                                Spacer()
                                Text("ためるサービス")
                                    .font(.title2)
                                Spacer()
                            }
                        case .use:
                            UseServiceView()
                        }
                    }
                    Spacer()
                    HStack {
                        Button("ホーム") { selectedTab = .home }
                            .foregroundColor(selectedTab == .home ? .blue : .gray)
                        Spacer()
                        Button("クーポン") { selectedTab = .coupon }
                            .foregroundColor(selectedTab == .coupon ? .blue : .gray)
                        Spacer()
                        Button("カード") { selectedTab = .card }
                            .foregroundColor(selectedTab == .card ? .blue : .gray)
                        Spacer()
                        Button("ためる") { selectedTab = .save }
                            .foregroundColor(selectedTab == .save ? .blue : .gray)
                        Spacer()
                        Button("つかう") { selectedTab = .use }
                            .foregroundColor(selectedTab == .use ? .blue : .gray)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                // ライフサイクル用トースト（上部）
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
                // Hello Worldトースト（下部）
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
        }
    }
}

#Preview {
    ContentView()
}
