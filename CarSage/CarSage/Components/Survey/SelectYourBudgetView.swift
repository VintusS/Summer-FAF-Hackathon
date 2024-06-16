//
//  SelectYourBudgetView.swift
//  CarSage
//
//  Created by Dragomir Mindrescu on 16.06.2024.
//

import SwiftUI

struct SelectYourBudgetView: View {
    @State private var minPrice = 0
    @State private var maxPrice = 50000
    @State private var paymentOption: PaymentOption = .cash
    @State private var navigateToExplore: Bool = false
    @State private var navigateToSurvey: Bool = false // State variable to control navigation to survey

    var prices: [Int] {
        Array(stride(from: 0, to: 200000, by: 5000))
    }

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
                Spacer()
            }
            .padding(.horizontal, 20)

            Text("Select Your Budget")
                .font(.custom("GTWalsheimTrial-Bd", size: 25))
                .foregroundColor(.black)
                .padding(.horizontal, 20)

            Text("Please select your preferred budget range and payment option.")
                .font(.custom("GTWalsheimTrial-Lt", size: 18))
                .foregroundColor(.gray)
                .padding(.horizontal, 20)

            HStack(spacing: 10) {
                Button(action: {
                    paymentOption = .cash
                }) {
                    Text("Cash")
                        .font(.custom("GTWalsheimTrial-Bd", size: 16))
                        .foregroundColor(paymentOption == .cash ? .white : .black)
                        .padding(15)
                        .padding(.horizontal, 15)
                        .background(paymentOption == .cash ? Color.black : Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }

                Button(action: {
                    paymentOption = .monthly
                }) {
                    Text("Monthly")
                        .font(.custom("GTWalsheimTrial-Bd", size: 16))
                        .foregroundColor(paymentOption == .monthly ? .white : .black)
                        .padding(15)
                        .padding(.horizontal, 15)
                        .background(paymentOption == .monthly ? Color.black : Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
            }
            .padding(.horizontal, 20)

            HStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Min Price")
                        .font(.custom("GTWalsheimTrial-Bd", size: 20))
                        .foregroundColor(.black)
                    Menu {
                        ForEach(prices, id: \.self) { price in
                            Button(action: {
                                minPrice = price
                            }) {
                                Text("$\(price)")
                                    .foregroundColor(.black)
                            }
                        }
                    } label: {
                        Text("$\(minPrice)")
                            .font(.custom("GTWalsheimTrial-Bd", size: 18))
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                }

                VStack(alignment: .leading) {
                    Text("Max Price")
                        .font(.custom("GTWalsheimTrial-Bd", size: 20))
                        .foregroundColor(.black)
                    Menu {
                        ForEach(prices, id: \.self) { price in
                            Button(action: {
                                maxPrice = price
                            }) {
                                Text("$\(price)")
                                    .foregroundColor(.black)
                            }
                        }
                    } label: {
                        Text("$\(maxPrice)")
                            .font(.custom("GTWalsheimTrial-Bd", size: 18))
                            .foregroundColor(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 2)
                            )
                    }
                }
            }
            .padding(.horizontal, 20)

            Spacer()

            Button(action: {
                // Action for next button
                navigateToSurvey = true
            }) {
                Text("Next")
                    .font(.custom("GTWalsheimTrial-Bd", size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }
            .padding(.bottom, 40)

            NavigationLink(destination: ExploreView().navigationBarHidden(true), isActive: $navigateToExplore) { EmptyView() }
            NavigationLink(destination: Survey(
                question: "Which body types would you consider for your new car?",
                subheading: "Choose as many as you want",
                answers: ["SUVs", "Hatchbacks", "Saloons", "Coupes", "Estate Cars", "People Carriers", "Sports Cars", "Convertibles"],
                multipleChoice: true,
                isLast: false
            ).navigationBarHidden(true), isActive: $navigateToSurvey) { EmptyView() }
        }
        .padding(.top, 70)
        .background(Color(hex: "#f3f3f3"))
        .edgesIgnoringSafeArea(.all)
    }
}

enum PaymentOption {
    case cash, monthly
}

struct SelectYourBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        SelectYourBudgetView()
    }
}
