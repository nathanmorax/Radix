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

// MARK: - TODO Style Keaboard
struct KeyView: View {
    var isRound = true
    let action: () -> Void
    let key: String?


    @ViewBuilder
    private var keyBoard: some View {
        if isRound {
            Button(action: action) {
                Circle()
                    .fill(Color.primaryKeyboard)
                    .frame(width: 44, height: 44)
                    .overlay(
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                    )
            }
        } else {
            Button(action: action) {
                Text(key ?? "")
                    .font(.courierPrimeBold(size: 18))
                    .foregroundStyle(Color.black)
                    .frame(maxWidth: .infinity, minHeight: 60)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.Button.primaryKeyboard)
                    )
            }
            .buttonStyle(ThreeDKeyButton(backGroundColor: Color.Button.tertiaryKeyboard))

        }
    }

    var body: some View {
        keyBoard // Aquí se muestra la vista del teclado
    }
}

#Preview {
    KeyView(isRound: true, action: {}, key: "")
        .padding()
    KeyView(isRound: false, action: {}, key: "")
        .padding()
}
