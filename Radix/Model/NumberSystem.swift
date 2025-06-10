//
//  NumberSystem.swift
//  Radix
//
//  Created by Jonathan Mora on 26/04/25.
//

import Foundation


public enum NumberSystem: CaseIterable {
    case decimal
    case binary
    case octal
    case hexadecimal
    
    
    var radix: Int {
        switch self {
        case .decimal:
            return 10
        case .binary:
            return 2
        case .octal:
            return 8
        case .hexadecimal:
            return 16
        }
    }
    
    var validKeys: [String] {
        switch self {
            case .decimal:
            return ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        case .binary:
            return ["1", "0"]
        case .octal:
            return ["1", "2", "3", "4", "5", "6", "7", "0"]
        case .hexadecimal:
            return ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
        }
    }
    
    var title: LocalizedStringResource {
         switch self {
         case .decimal:
             return "Decimal"
         case .binary:
             return "Binary"
         case .octal:
             return "Octal"
         case .hexadecimal:
             return "Hex"
         }
     }
}
