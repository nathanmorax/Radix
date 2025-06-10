//
//  AdaptiveLayout.swift
//  Radix
//
//  Created by Jonathan Mora on 05/05/25.
//
import SwiftUI

struct AdaptiveLayoutContainerModifier: ViewModifier {
    
    let padding: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(padding)
            .background(Color.Background.opacity(0.8))
            .cornerRadius(12)
    }
}


extension View {
    
   /* func adaptiveContainer(padding: CGFloat = 8) -> some View {
        modifier(AdaptiveLayoutContainerModifier(padding: padding))
    }*/
}
