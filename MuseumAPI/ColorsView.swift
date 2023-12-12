//
//  ColorsView.swift
//  MuseumAPI
//
//  Created by jose Yun on 12/11/23.
//

import SwiftUI

struct ColorsView: View {
    var colors: [SwiftUI.Color] = [.white, .black, .orange]
    @Binding var isShowingImage: Bool
    @State var isShowingColor: Bool = true
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                ZStack {
                    UnevenRoundedRectangle(topLeadingRadius: 5.0, bottomLeadingRadius: 5.0, bottomTrailingRadius: 0.0, topTrailingRadius: 10.0)
                    
                    UnevenRoundedRectangle(topLeadingRadius: 5.0, bottomLeadingRadius: 5.0, bottomTrailingRadius: 10.0, topTrailingRadius: 10.0)
                        .foregroundStyle(color)
                        .padding(.trailing, 2)
                }
            }
        }
        .opacity(isShowingColor ? 1.0 : 0.0)
        .onChange(of: colors) {
            withAnimation(.linear(duration: 1.0)) {
                self.isShowingColor = true
            }
        }
        .onChange(of: isShowingImage) { _ in
            if isShowingImage == true {
                withAnimation(.linear(duration: 1.0)) {
                    self.isShowingColor = false
                }
            }
        }
    }
}

#Preview {
    ColorsView(isShowingImage: .constant(true))
}
