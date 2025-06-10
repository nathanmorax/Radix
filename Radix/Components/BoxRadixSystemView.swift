//
//  BoxRadixSystemView.swift
//  Radix
//
//  Created by Jonathan Mora on 02/05/25.
//
import SwiftUI

struct BoxRadixSystemView: View {
    var titleSystemNumber: String
    var isSelected: Bool

    @Environment(\.verticalSizeClass) var sizeClass


    var body: some View {
        let offset: CGFloat = 6
        let topColor = Color.Button.boxRadixGreen
        let frontColor = topColor.opacity(0.6)

        let scale: CGFloat = sizeClass == .compact ? 2.0 : 1.0

        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(frontColor)
                .offset(y: offset)

            RoundedRectangle(cornerRadius: 4)
                .foregroundStyle(topColor)
                .overlay(
                    HStack {
                        Text(titleSystemNumber)
                            .fontWeight(.light)
                            .font(.courierPrimeBold(size: 12 * scale))
                            .foregroundStyle(.black)
                    }
                )
                .offset(y: isSelected ? offset : 0)
        }
        .compositingGroup()
        .shadow(radius: 6, y: 4)
        .frame(maxWidth: .infinity, maxHeight: 40 * scale)
    }
}

