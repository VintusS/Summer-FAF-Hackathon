//
//  ReusableSurveyView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 15.06.2024.
//

import SwiftUI

struct SurveyView: View {
    let question: String
    let answers: [String]
    let multipleChoice: Bool
    let isLast: Bool
    @State private var navigateToExplore: Bool = false
    @State private var selectedAnswers: [String: Bool] = [:]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Button(action: {
                    navigateToExplore = true
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .padding(8)
                        .frame(width: 50, height: 50)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(color: .gray, radius: 4, x: 0, y: 2)
                }
            }
            .padding(.horizontal, 20)
            Text(question)
                .font(.custom("GTWalsheimTrial-Bd", size: 20))
                .foregroundColor(.black)
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            
            ForEach(answers, id: \.self) { answer in
                Button(action: {
                    toggleSelection(for: answer)
                }) {
                    HStack {
                        Text(answer)
                            .font(.custom("GTWalsheimTrial-Bd", size: 20))
                            .foregroundColor(.black)
                        Spacer()
                        if selectedAnswers[answer] == true {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    .background(selectedAnswers[answer] == true ? Color.gray.opacity(0.3) : Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .padding(.horizontal, 20)
                }
            }

            Spacer()

            Button(action: {
                // Action for next/finish button
                if isLast {
                    print("Finish button tapped")
                } else {
                    print("Next button tapped")
                }
            }) {
                Text(isLast ? "End Survey" : "Next")
                    .font(.custom("GTWalsheimTrial-Bd", size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }
            .padding(.bottom, 40)
        }
        .padding(.top, 70)
        .background(Color(hex: "#f3f3f3"))
        .edgesIgnoringSafeArea(.all)
        .background(
            NavigationLink(destination: ExploreView().navigationBarHidden(true), isActive: $navigateToExplore) { EmptyView() }
        )
    }

    private func toggleSelection(for answer: String) {
        if multipleChoice {
            if let isSelected = selectedAnswers[answer] {
                selectedAnswers[answer] = !isSelected
            } else {
                selectedAnswers[answer] = true
            }
        } else {
            selectedAnswers.keys.forEach { key in
                selectedAnswers[key] = false
            }
            selectedAnswers[answer] = true
        }
    }
}

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView(
            question: "What are your favorite colors?",
            answers: ["Red", "Blue", "Green", "Yellow"],
            multipleChoice: true,
            isLast: false
        )
    }
}

