//
//  NumberConverter.swift
//  Radix
//
//  Created by Jonathan Mora on 28/04/25.
//

struct NumberConverter {
    static func convertToRadix(_ value: String, from fromSystem: NumberSystem, to toSystem: NumberSystem) -> String {
        
        guard let decimalValue = Int(value, radix: fromSystem.radix) else {
            return "0"
        }
        
        return String(decimalValue, radix: toSystem.radix).uppercased()
    }
}

struct KeyboardLogic {
    static func swapSystems(
        input: String,
        selectedSystemFrom: NumberSystem?,
        selectedSystemTo: NumberSystem?
    ) -> (newInput: String, newFrom: NumberSystem?, newTo: NumberSystem?) {
        
        guard let systemFrom = selectedSystemFrom,
              let systemTo = selectedSystemTo else {
            print("No se puede hacer swap, no se ha seleccionado salida a convertir")
            return (input, selectedSystemFrom, selectedSystemTo)
        }
        
        let convertedInput = NumberConverter.convertToRadix(input, from: systemFrom, to: systemTo)
        
        return (convertedInput, systemTo, systemFrom)
    }
}


struct ValidateInputTextField {
    func cleanDecimalInput(_ text: String) -> String {
        if text == "0" { return "" }
        if text.hasPrefix("0") && text.count > 1 {
            return String(text.dropFirst())
        }
        return text
    }
}




