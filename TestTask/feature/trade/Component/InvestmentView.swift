//
//  InvestmentView.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct InvestmentView: View {
    
    @Binding var investment: String
    @State var investmentValue: Double
    
    init(investment: Binding<String>) {
        _investment = Binding(projectedValue: investment)
        _investmentValue = State(initialValue: Double(investment.wrappedValue) ?? 0)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Investment")
                .font(.custom("Inter", size: 12).weight(.medium))
                .padding(.bottom, 7)
            HStack {
                Button(action: {
                    if investmentValue >= 0 {
                        investmentValue -= 1
                        investment = String(investmentValue)
                    }
                }, label: {
                    Image(systemName: "minus.circle")
                })
                .padding(.trailing, 17)
                TextField("1,00", text: $investment) {
                    if investmentValue < 0 {
                        investment = "1.0"
                    }
                }
                    .keyboardType(.numberPad)
                    .foregroundColor(.white)
                    .font(.custom("Inter", size: 16).weight(.bold))
                    .minimumScaleFactor(0.8)
                
                Button(action: {
                    investmentValue += 1
                    investment = String(investmentValue)
                }, label: {
                    Image(systemName: "plus.circle")
                })
                .padding(.leading, 17)
            }
        }
        .foregroundColor(Color(hex: "C8C8C8"))
        .padding(.vertical)
        .padding(.horizontal, 15)
        .frame(maxWidth: .infinity, maxHeight: 54)
        .background(Color(hex: "333749"))
        .cornerRadius(16)
    }
}
