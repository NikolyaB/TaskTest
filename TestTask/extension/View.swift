//
//  View.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct AnimatableNumberLoaderModifier: AnimatableModifier {
    var number: Double
    
    var animatableData: Double {
        get { number }
        set { number = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Text("\(Int(number))%")
                    .foregroundColor(.white)
                    .font(.custom("Inter", size: 16).weight(.heavy))
            )
    }
}

extension View {
    func percentAnimate(for number: Double) -> some View {
        modifier(AnimatableNumberLoaderModifier(number: number))
    }
}
