//
//  LaunchScreenView.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct LaunchScreenView: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    @State private var firstAnimation = false
    @State private var secondAnimation = false
    @State private var startFadeoutAnimation = false
    
    @State var percent: CGFloat = 0
    let width: CGFloat = 200
    let height: CGFloat = 20
    let radius: CGFloat = 20
    
    var body: some View {
        let multiplier = width / 100
        
        ZStack(alignment: .center) {
            backgroundColor
            
            Color.clear
                .zIndex(2)
                .percentAnimate(for: percent)
            
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .frame(width: width, height: height)
                    .foregroundColor(Color(hex: "5B5A60"))
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .frame(width: !firstAnimation ? percent * multiplier : percent * multiplier, height: height)
                    .foregroundColor(Color(hex: "35B972"))
            }
        }
        .onReceive(animationTimer) { timerValue in
            updateAnimation()
        }
        .opacity(startFadeoutAnimation ? 0 : 1)
    }
    
    @ViewBuilder
    private var backgroundColor: some View {
        Color(red: 0.11, green: 0.12, blue: 0.18).ignoresSafeArea()
    }
    
    private let animationTimer = Timer
        .publish(every: 1.5, on: .current, in: .common)
        .autoconnect()
    
    private func updateAnimation() {
        switch launchScreenState.state {
        case .firstStep:
            withAnimation(.linear) {
                firstAnimation.toggle()
                percent = 100
            }
        case .secondStep:
            if secondAnimation == false {
                withAnimation(.linear) {
                    startFadeoutAnimation = true
                }
            }
        case .finished:
            break
        }
    }
}

#Preview {
    LaunchScreenView()
}
