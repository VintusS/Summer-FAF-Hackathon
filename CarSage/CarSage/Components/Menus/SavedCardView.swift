//
//  SavedCardView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 16.06.2024.
//

import SwiftUI

struct SavedCardView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Your main content
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Text("Saved Cars")
                                .font(.custom("GTWalsheimTrial-Md", size: 30))
                            Spacer()
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 30)
                }
                .background(Color(hex: "#f3f3f3"))
                
                VStack {
                    Spacer()
                    FloatingFooterMenu()
                        .padding(.horizontal, 30)
                }
            }
            .background(Color(hex: "#f3f3f3"))
        }
    }
}

#Preview {
    SavedCardView()
}
