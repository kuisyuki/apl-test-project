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