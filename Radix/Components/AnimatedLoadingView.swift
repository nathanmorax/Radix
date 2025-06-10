//
//  AnimatedLoadingView.swift
//  Radix
//
//  Created by Jonathan Mora on 02/05/25.
//
import SwiftUI

struct AnimatedLoadingView: View {
    let fullText = String(localized: "Loading...")
    @State private var displayedText = ""
    @State private var charIndex = 0

    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()

    var body: some View {
        Text(displayedText)
            .font(.courierPrimeBold(size: 40))
            .foregroundColor(Color.Button.boxRadixGreen)
            .onReceive(timer) { _ in
                if charIndex < fullText.count {
                    let index = fullText.index(fullText.startIndex, offsetBy: charIndex)
                    displayedText.append(fullText[index])
                    charIndex += 1
                }
            }
    }
}
