//
//  TopScreenViewModel.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import Foundation

struct TopTradersItem: Identifiable, Hashable {
    let id = UUID()
    let country: String
    let name: String
    let deposit: String
    var profit: String
}

class TopScreenViewModel: ObservableObject {
    
    @Published var sortedTopTraders: [TopTradersItem] = []
    @Published var timer = Timer
        .publish(every: 1.5, on: .current, in: .common)
        .autoconnect()
    
    init() {
        self.sortedTopTraders = sortTopTraders()
    }
    
    func updateProfit() {
        let randomTrader = Int.random(in: 0..<sortedTopTraders.count)
        let randomInt = Int.random(in: -150..<50)
        let randomBool = Bool.random()
        
        if randomBool {
            topTradersItem[randomTrader].profit = String((Int(topTradersItem[randomTrader].profit)!) - randomInt)
        } else {
            topTradersItem[randomTrader].profit = String((Int(topTradersItem[randomTrader].profit)!) + randomInt)
        }
        
        sortedTopTraders = sortTopTraders()
    }
    
    private func sortTopTraders() -> Array<TopTradersItem> {
        return topTradersItem.sorted { $0.profit > $1.profit }
    }
    

    private var topTradersItem = [
        TopTradersItem(
            country: "ic_usa",
            name: "Oliver",
            deposit: "2367",
            profit: "3336555"
        ),
        TopTradersItem(
            country: "ic_canada",
            name: "Jack",
            deposit: "2367",
            profit: "3336155"
        ),
        TopTradersItem(
            country: "ic_brazil",
            name: "Harry",
            deposit: "2367",
            profit: "3335455"
        ),
        TopTradersItem(
            country: "ic_south_korea",
            name: "Jacob",
            deposit: "2367",
            profit: "3337535"
        ),
        TopTradersItem(
            country: "ic_germany",
            name: "Charley",
            deposit: "2367",
            profit: "3335675"
        ),
        TopTradersItem(
            country: "ic_spain",
            name: "Thomas",
            deposit: "2367",
            profit: "3336745"
        ),
        TopTradersItem(
            country: "ic_new_zealand",
            name: "George",
            deposit: "2367",
            profit: "3326755"
        ),
        TopTradersItem(
            country: "ic_usa",
            name: "Oscar",
            deposit: "2367",
            profit: "3236755"
        ),
        TopTradersItem(
            country: "ic_brazil",
            name: "James",
            deposit: "2367",
            profit: "3536755"
        ),
        TopTradersItem(
            country: "ic_spain",
            name: "William",
            deposit: "2367",
            profit: "3366755"
        ),
    ]
    
}
