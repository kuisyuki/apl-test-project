import SwiftUI

struct HomeView: View {
    @Binding var lifecycleHistory: String
    @Binding var showHelloToast: Bool
    var body: some View {
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
    }
} 