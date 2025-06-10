//
//  Keyboard.swift
//  Radix
//
//  Created by Jonathan Mora on 26/04/25.
//

import SwiftUI

struct Keyboard: View {
    
    @Binding var typeKeyboard: String
    @Binding var selectedSystemFrom: NumberSystem?
    @Binding var selectedSystemTo: NumberSystem?
    @State private var keyPressed: String? = nil
    
    let system: NumberSystem
    
    private var keyboardRows: [[String]] {
        let keys = system.validKeys
        
        switch system {
        case .decimal:
            return [
                Array(keys.prefix(5)),
                Array(keys.suffix(4))
            ]
        case .binary:
            return [keys]
        case .octal:
            return [
                Array(keys.prefix(4)),
                Array(keys.suffix(4))
            ]
        case .hexadecimal:
            return [
                Array(keys[0..<6]),
                Array(keys[6..<11]),
                Array(keys[11..<16])
            ]

        }
    }
     
    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            ForEach(0..<keyboardRows.count, id: \.self) { rowIndex in
                if !keyboardRows[rowIndex].isEmpty {
                    HStack(spacing: 6) {
                       
                        if rowIndex == 1 {
                            Spacer(minLength: 15)
                        }
                        
                        ForEach(keyboardRows[rowIndex], id: \.self) { key in
                            KeyButton(key: key) {
                                typeKeyboard.append(key)
                                keyPressed = key
                            }
                            .buttonStyle(ThreeDKeyButton(backGroundColor: Color.Button.tertiaryKeyboard))
                        }
                        
                        if rowIndex == 1 {
                            Spacer(minLength: 15)
                        }
                   }
                }
            }
            HStack(spacing: 8) {
                
                ActionButtonsView(sysstemImage: "arrow.up.arrow.down") {
                    self.swapSystems()
                }

                
                ActionButtonsView(sysstemImage: "delete.left") {
                    self.deleteInput()
                }
            }
        }
    }
    
    private func swapSystems() {
        let result = KeyboardLogic.swapSystems(
            input: typeKeyboard,
            selectedSystemFrom: selectedSystemFrom,
            selectedSystemTo: selectedSystemTo
        )

        typeKeyboard = result.newInput
        selectedSystemFrom = result.newFrom
        selectedSystemTo = result.newTo
    }
    
    private func deleteInput() {
        if !typeKeyboard.isEmpty {
            typeKeyboard.removeLast()
        }
    }
}


struct ActionButtonsView: View {
    var sysstemImage: String
    let action: () -> Void

    var body: some View {
        HStack(spacing: 8) {
            Button(action: action) {
                Image(systemName: sysstemImage)
                    .foregroundStyle(.white)
                    .font(.title2)
                    .frame(maxWidth: .infinity, minHeight: 60)
            }
            .buttonStyle(ThreeDKeyButton(backGroundColor: Color.Button.tertiaryKeyboard))

        }
    }
}
