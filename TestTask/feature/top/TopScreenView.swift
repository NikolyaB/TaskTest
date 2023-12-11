//
//  TopScreenView.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct TopScreenView: View {
    
    @StateObject var viewModel = TopScreenViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "1C1F2D").ignoresSafeArea(edges: .all)
                
                ScrollView {
                    VStack {
                        TopTradersView(viewModel: viewModel)
                            .padding(.horizontal, 12)
                            .padding(.top, 20)
                    }
                }
                .onAppear {
                    print(
                        viewModel.sortedTopTraders
                    )
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("TOP 10 Traders")
            }
        }
    }
}

#Preview {
    TopScreenView()
}
