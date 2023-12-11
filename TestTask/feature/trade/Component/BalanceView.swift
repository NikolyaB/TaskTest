//
//  BalanceView.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct BalanceView: View {
    let balance: String
    
    init(balance: String) {
        self.balance = balance
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Balance")
                .foregroundColor(Color(hex: "C8C8C8"))
                .font(.custom("Inter", size: 12).weight(.medium))
                .padding(.bottom, 7)
            Text(balance)
                .foregroundColor(Color.white)
                .font(.custom("Inter", size: 16).weight(.bold))
        }
        .padding(.top, 5)
        .padding(.bottom, 8)
        .frame(maxWidth: .infinity)
        .background(Color(hex: "333749"))
        .cornerRadius(16)
    }
}

#Preview {
    BalanceView(balance: "10000")
}
