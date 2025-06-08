import SwiftUI

struct UseServiceView: View {
    let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // ヘッダー
                Text("つかうサービス")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                
                VStack(spacing: 20) {
                    // ゲームの課金
                    VStack(alignment: .leading, spacing: 8) {
                        Text("ゲームの課金に使う")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            // Ponta PLAYの処理
                        }) {
                            HStack {
                                Text("Ponta PLAYですべて見る")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    // ポンタグッズ
                    VStack(alignment: .leading, spacing: 8) {
                        Text("ポンタグッズや特典への交換に使う")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            // 特典交換の処理
                        }) {
                            HStack {
                                Text("Ponta特典交換ですべて見る")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    // Pontaマンガ
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Pontaマンガで使う")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            // マンガの処理
                        }) {
                            HStack {
                                Text("Pontaマンガを見る")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    // その他サービス
                    VStack(alignment: .leading, spacing: 8) {
                        Text("その他サービスで使う")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 16) {
                            ServiceRow(icon: "arrow.triangle.2.circlepath", title: "ポイント交換")
                            ServiceRow(icon: "creditcard", title: "STOCK POINT for CONNECT")
                            ServiceRow(icon: "shield", title: "Ponta保険")
                            ServiceRow(icon: "tag", title: "買っトク！Ponta")
                            ServiceRow(icon: "ticket", title: "お試し引換券")
                        }
                    }
                    .padding(.horizontal)
                    
                    // たまる・つかえるお店、サービス
                    VStack(alignment: .leading, spacing: 8) {
                        Text("たまる・つかえるお店、サービス")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                        
                        // グリッドレイアウト
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(1...15, id: \.self) { index in
                                VStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color.gray.opacity(0.1))
                                        .frame(height: 80)
                                        .overlay(
                                            Text(index % 2 == 0 ? "サービス\(index/2)" : "お店\(index/2 + 1)")
                                                .foregroundColor(.primary)
                                        )
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        Button(action: {
                            // 全てのお店、サービスを見る処理
                        }) {
                            HStack {
                                Text("全てのお店、サービスを見る")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
        }
    }
}

struct ServiceRow: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 24, height: 24)
            Text(title)
                .foregroundColor(.primary)
            Spacer()
        }
    }
}

#Preview {
    UseServiceView()
} 