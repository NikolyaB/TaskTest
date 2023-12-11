//
//  TopTradersView.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct TopTradersView: View {
   
    @StateObject var viewModel: TopScreenViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center) {
                Group {
                    Text("№")
                    Text("Country")
                        .padding(.leading, 8)
                    Text("Name")
                        .padding(.leading, 16)
                    Spacer()
                    Text("Deposit")
                        .padding(.trailing, 40)
                    Text("Profit")
                }
                .font(
                    Font.custom("Inter", size: 12)
                        .weight(.medium)
                )
                .foregroundColor(Color(hex: "C1C2C8"))
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 9)
            .background(Color(hex: "2E303E"))
            ForEach(0..<viewModel.sortedTopTraders.count, id: \.self) { index in
                HStack(alignment: .center) {
                    Group {
                        Text(String(index + 1))
                        Image(viewModel.sortedTopTraders[index].country)
                            .padding(.horizontal, 16)
                        Text(viewModel.sortedTopTraders[index].name)
                        Spacer()
                        Text("$\(viewModel.sortedTopTraders[index].deposit)")
                            .padding(.trailing, 20)
                        Text("$\(viewModel.sortedTopTraders[index].profit)")
                            .foregroundColor(Color(hex: "35B972"))
                    }
                    .foregroundColor(.white)
                    .font(.custom("Inter", size: 14).weight(.medium))
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 9)
                .background(index % 2 == 0 ? Color(hex: "1C1F2D") : Color(hex: "2E303E"))
            }
            .onReceive(viewModel.timer) { timerValue in
                withAnimation(.easeInOut) {
                    viewModel.updateProfit()
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TopTradersView(viewModel: TopScreenViewModel())
}
