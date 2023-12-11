//
//  TimerView.swift
//  TestTask
//
//  Created by Nikolay Bocharnikov on 10.12.2023.
//

import SwiftUI

struct TimerView: View {
    @State private var timerValue: Int = 1
    @Binding var time: String

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Timer")
                .font(
                    Font.custom("Inter", size: 12)
                        .weight(.medium)
                )
                .padding(.bottom, 7)
            HStack {
                Button(action: {
                    if self.timerValue > 0 {
                        self.timerValue -= 1
                        self.time = String(format: "%02d:%02d", self.timerValue / 60, self.timerValue % 60)
                    }
                }, label: {
                    Image(systemName: "minus.circle")
                })
                .padding(.trailing, 17)
                
                TextField("00:00", text: $time) {
                    let components = self.time.split(separator: ":")
                    let minutes = Int(components[0]) ?? 0
                    let seconds = Int(components[1]) ?? 0
                    if minutes >= 0 && seconds >= 0 {
                        self.timerValue = minutes * 60 + seconds
                    }
                }
                .keyboardType(.numberPad)
                .foregroundColor(.white)
                .font(.custom("Inter", size: 16).weight(.bold))
                .minimumScaleFactor(0.7)
                
                Button(action: {
                    self.timerValue += 1
                    self.time = String(format: "%02d:%02d", self.timerValue / 60, self.timerValue % 60)
                }, label: {
                    Image(systemName: "plus.circle")
                })
                .padding(.leading, 17)
            }
        }
        .foregroundColor(Color(hex: "C8C8C8"))
        .padding(.vertical)
        .padding(.horizontal, 15)
        .frame(maxWidth: .infinity, maxHeight: 54)
        .background(Color(hex: "333749"))
        .cornerRadius(16)
    }
}
