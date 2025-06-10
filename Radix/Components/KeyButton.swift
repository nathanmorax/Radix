//
//  KeyButton.swift
//  Radix
//
//  Created by Jonathan Mora on 02/05/25.
//

import SwiftUI

struct KeyButton: View {
    let key: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(key)
                .font(.courierPrimeBold(size: 18))
                .foregroundStyle(Color.black)
                .frame(maxWidth: .infinity, minHeight: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.Button.primaryKeyboard)
                )
        }
    }
}
