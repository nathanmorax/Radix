//
//  BaseConverteViewModel.swift
//  Radix
//
//  Created by Jonathan Mora on 17/07/25.
//

import SwiftUI
import Observation

@Observable
final class BaseConverterViewModel {
    var selectedSystemFrom: NumberSystem? = nil
    var selectedSystemTo: NumberSystem? = nil
    var input: String = ""
    
    var convertedValue: String {
        guard let from = selectedSystemFrom, let to = selectedSystemTo else {
            return "0"
        }
        return NumberConverter.convertToRadix(input, from: from, to: to)
    }
}



