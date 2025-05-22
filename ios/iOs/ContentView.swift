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

#Preview {
    ContentView()
}
