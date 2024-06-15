//
//  LikeButtonView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct LikeButtonView: View {
    let width: CGFloat
    let height: CGFloat
    @State private var isLiked: Bool = false

    var body: some View {
        Button(action: {
            isLiked.toggle()
        }) {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height) // Adjust size as needed
                .foregroundColor(isLiked ? .red : .black)
        }
    }
}

struct LikeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LikeButtonView(width: 50, height: 50)
    }
}

