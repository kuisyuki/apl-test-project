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
    @State private var showMenu = false
    @State private var showNotifications = false
    
    enum Tab {
        case home, coupon, card, save, use
        
        var title: String {
            switch self {
            case .home: return "ホーム"
            case .coupon: return "クーポン"
            case .card: return "カード"
            case .save: return "ためる"
            case .use: return "つかう"
            }
        }
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
        ZStack {
            NavigationView {
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
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        HStack(spacing: 8) {
                            Button(action: {
                                withAnimation(.spring()) {
                                    showMenu.toggle()
                                }
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .foregroundColor(.primary)
                            }
                            Text(selectedTab.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showNotifications = true
                        }) {
                            Image(systemName: "bell")
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            
            if showMenu {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showMenu = false
                        }
                    }
            }
            
            if showMenu {
                HStack(spacing: 0) {
                    SlideMenuView(showMenu: $showMenu)
                        .frame(width: 300)
                        .transition(.move(edge: .leading))
                    
                    Spacer()
                }
                .ignoresSafeArea()
            }
        }
        .sheet(isPresented: $showNotifications) {
            NotificationListView()
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

struct SlideMenuView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("メニュー")
                        .font(.title)
                        .bold()
                    Spacer()
                    Button(action: {
                        withAnimation(.spring()) {
                            showMenu = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.primary)
                            .padding()
                    }
                }
                .padding()
                
                Divider()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        MenuButton(title: "設定", icon: "gear") {
                            // 設定画面への遷移
                        }
                        MenuButton(title: "ヘルプ", icon: "questionmark.circle") {
                            // ヘルプ画面への遷移
                        }
                        MenuButton(title: "お問い合わせ", icon: "envelope") {
                            // お問い合わせ画面への遷移
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct MenuButton: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .frame(width: 24, height: 24)
                Text(title)
                Spacer()
            }
            .foregroundColor(.primary)
            .padding()
        }
    }
}

struct NotificationListView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List {
                ForEach(1...5, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 8) {
                        Text("お知らせ \(index)")
                            .font(.headline)
                        Text("これはサンプルのお知らせメッセージです。")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("お知らせ")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
