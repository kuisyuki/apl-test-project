import SwiftUI

struct SplashView: View {
    @Binding var showSplash: Bool

    var body: some View {
        VStack {
            Text("起動中")
                .font(.largeTitle)
                .padding()
        }
        .onAppear {
            // 2秒後にshowSplashをfalseにする
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.showSplash = false
            }
        }
    }
}

#Preview {
    SplashView(showSplash: .constant(true))
} 