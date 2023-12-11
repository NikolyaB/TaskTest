//
//  ViewFactory.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

final class ViewFactory {
    @ViewBuilder func makeView(for screenRoute: ScreenRoute?) -> some View {
        switch screenRoute {
        case .trade?: TradeScreenView()
        case .top?: TopScreenView()
        case .currency_pair?: CurrencyPairScreenView()
            
        default:
            EmptyView()
        }
    }
}
