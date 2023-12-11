//
//  onCurrencyPairButton.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct onCurrencyPairButton: View {
    let currency: String
    var isNavigation: Bool
    var isActive: Bool
    let onButtonClick: () -> Void
    
    init(currency: String, isNavigation: Bool = false, isActive: Bool = false, onButtonClick: @escaping () -> Void) {
        self.currency = currency
        self.isNavigation = isNavigation
        self.isActive = isActive
        self.onButtonClick = onButtonClick
    }
    
    var body: some View {
        Button(action: {
            onButtonClick()
        }) {
            ZStack(alignment: .center) {
                VStack(spacing: 0) {
                    Text(currency)
                        .font(.custom("Inter", size: 16).weight(.bold))
                }
                .frame(maxWidth: .infinity, alignment: .center)
                if (isNavigation) {
                    Image(systemName: "chevron.forward")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 11)
                }
            }
            .foregroundColor(Color.white)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(isActive ? Color(hex: "35B972") : Color(hex: "333749"))
            .cornerRadius(16)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    onCurrencyPairButton(currency: "GPB/USD", isNavigation: true) {
        print("HelloWorld")
    }
}
