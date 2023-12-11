//
//  CurrencyPairScreenView.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct CurrencyPairScreenView: View {

    @ObservedObject var viewModel = CurrencyPairScreenViewModel.shared
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Inter-Bold", size: 22)!]
    }

    let columns = [
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        ZStack {
            Color(hex: "121629").ignoresSafeArea(edges: .all)

            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(viewModel.currencyPairItems, id: \.self) { item in
                        onCurrencyPairButton(
                            currency: item.currencyPair,
                            isActive: item == viewModel.currentCurrencyPair,
                            onButtonClick: {
                                viewModel.currentCurrencyPair = item
                            }
                        ).padding(.horizontal, 7)
                    }
                    .padding(.bottom, 20)
                }
                .padding(.horizontal, 30)
                .padding(.top, 36)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button (action: {
                        self.presentationMode.wrappedValue.dismiss()
                    } ) {
                        Image(systemName: "chevron.left")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Currency pair")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CurrencyPairScreenView()
}

struct HideBackButton: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.navigationItem.hidesBackButton = true
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
