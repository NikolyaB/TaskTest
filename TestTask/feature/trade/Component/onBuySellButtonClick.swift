//
//  onBuySellButton.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct onBuySellButton: View {
    let title: String
    let color: Color
    let onButtonClick: () -> Void
    
    init(title: String, color: Color, onButtonClick: @escaping () -> Void) {
        self.title = title
        self.color = color
        self.onButtonClick = onButtonClick
    }
    
    var body: some View {
        Button(action: {
            onButtonClick()
        }) {
            Text(title)
                .font(
                    Font.custom("Inter", size: 24)
                        .weight(.medium)
                )
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .foregroundColor(Color.white)
                .padding(.leading, 20)
                .padding(.top, 8)
                .padding(.bottom, 17)
                .frame(maxWidth: .infinity, maxHeight: 54)
                .background(color)
                .cornerRadius(16)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    onBuySellButton(title: "Sell", color: Color(hex: "FE3D43"), onButtonClick: {})
}
