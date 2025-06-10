//
//  Color.swift
//  Radix
//
//  Created by Jonathan Mora on 28/04/25.
//

import SwiftUI

extension Color {
    static let Background = Color("Background")
    
    enum Button {
        static let boxRadixGreen = Color("boxRadixGreen")
        static let primaryKeyboard = Color("primaryKeyboard")
        static let secondaryKeyboard = Color("secondaryKeyboard")
        static let tertiaryKeyboard = Color("tertiaryKeyboard")
        static let backgroundLaunchScreen = Color("backgroundLaunchScreen")
    }
    
    enum Text {
        
        static let primary = Color("tertiaryKeyboard")
        static let secondary = Color("secondaryKeyboard")
        static let tertiary = Color("boxRadixGreen")
    }
}
