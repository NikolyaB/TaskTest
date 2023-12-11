//
//  TradeScreenView.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct TradeScreenView: View {
    
    @StateObject var viewModel = TradeScreenViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "121629").ignoresSafeArea(edges: .all)
                
                ScrollView {
                    TradeView(viewModelTrade: _viewModel)
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Trade")
            }
        }
    }
}

#Preview {
    TradeScreenView()
}
