//
//  AsyncImage.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct ImageView: View {
    let imageUrl: String
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
            } else if phase.error != nil {
                Color.red // Indicates an error occurred
            } else {
                Color.white // Placeholder color while loading
            }
        }
        .frame(width: width, height: height)
        .clipped()
        .background(Color.clear)
    }
}

#Preview {
    ImageView(imageUrl: "https://i.pinimg.com/originals/5d/45/15/5d4515bc04668518ac28000947d0e3bc.png", width: 210, height: 174)
}
