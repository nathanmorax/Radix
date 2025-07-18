//
//  ThreeDKeyButton.swift
//  Radix
//
//  Created by Jonathan Mora on 02/05/25.
//
import SwiftUI

struct ThreeDKeyButton: ButtonStyle {
    
    var backGroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .top) {
            
            let offSet: CGFloat = 7
            
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(backGroundColor.opacity(0.7))
                .offset(y: offSet)
            
            RoundedRectangle(cornerRadius: 6)
                .foregroundStyle(backGroundColor)
                .offset(y: configuration.isPressed ? offSet : 0)
            
            configuration.label
                .offset(y: configuration.isPressed ? offSet : 0)
            
        }
        .frame(maxHeight: 60)
        .compositingGroup()
        .shadow(radius: 6, y: 4)
    }
}


struct ButtonMenuOptions: View {
    let action: () -> Void

    var body: some View {
        HStack(spacing: 8) {
            Button(action: action) {
                Circle()
                    .fill(Color.primaryKeyboard)
                    .padding(.all, 8)
            }
            .buttonStyle(ThreeDKeyButton(backGroundColor: Color.tertiaryKeyboard))
        }
    }
}

