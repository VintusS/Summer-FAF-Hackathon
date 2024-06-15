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
    ImageView(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEexxhffIxugMJXNaS65xIDGY8Fu2s-2Sa4Q&s", width: 200, height: 174)
}
