//
//  CurrencyPairScreenViewModel.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import Foundation

struct CurrencyPairItem: Identifiable, Hashable {
    let id = UUID()
    let currencyPair: String
    let link: Int
}

class CurrencyPairScreenViewModel: ObservableObject {
    
    static let shared: CurrencyPairScreenViewModel = CurrencyPairScreenViewModel()
    
    @Published var currentCurrencyPair: CurrencyPairItem
    
    init() {
        self.currentCurrencyPair = currencyPairItems[0]
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    let currencyPairItems = [
        CurrencyPairItem(currencyPair: "RUB / GPB",link: 0),
        CurrencyPairItem(currencyPair: "USD / RUB", link: 0),
        CurrencyPairItem(currencyPair: "GPB / USD", link: 1),
        CurrencyPairItem(currencyPair: "EUR / USD", link: 1)
    ]
}
