//
//  TradeScreenViewModel.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import Foundation

class TradeScreenViewModel: ObservableObject {
    
    @Published var timer = "00:00"
    @Published var investment: String = "1.00"
}
