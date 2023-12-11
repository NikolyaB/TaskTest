//
//  TradeView.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct TradeView: View {
    
    //Да, знаю кринж
    @StateObject var viewModelTrade: TradeScreenViewModel
    @StateObject var viewModelCurrencyPair = CurrencyPairScreenViewModel.shared
    
    init(viewModelTrade: StateObject<TradeScreenViewModel>) {
        _viewModelTrade = viewModelTrade
    }
    
    
    @State private var htmlContent: String = ""
    @State var isActive: Bool = false
    let viewFactory = ViewFactory()


    var body: some View {
        VStack(spacing: 0) {
            BalanceView(balance: "10 000")
                .padding(.horizontal, 30)
            
            TradeWebView(link: viewModelCurrencyPair.currentCurrencyPair.link)
                .frame(height: 320)
                .padding(.top, 25)
            
            VStack(spacing: 10) {
                NavigationLink(destination: viewFactory.makeView(for: .currency_pair), isActive: $isActive) {
                    onCurrencyPairButton(
                        currency: viewModelCurrencyPair.currentCurrencyPair.currencyPair,
                        isNavigation: true,
                        onButtonClick: {
                            isActive = true
                        }
                    )
                }
                
                HStack{
                    TimerView(time: $viewModelTrade.timer)
                    InvestmentView(investment: $viewModelTrade.investment)
                }
                HStack {
                    onBuySellButton(
                        title: "Sell",
                        color: Color(hex: "FE3D43"),
                        onButtonClick: {
                            
                        }
                    )
                    onBuySellButton(
                        title: "Buy",
                        color: Color(hex: "35B972"),
                        onButtonClick: {
                            
                        }
                    )
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 21)
            
            
            
            Spacer()
        }
    }
}
