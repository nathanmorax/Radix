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
