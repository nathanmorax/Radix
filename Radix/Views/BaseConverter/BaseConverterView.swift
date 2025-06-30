//
//  ContentView.swift
//  Radix
//
//  Created by Jonathan Mora on 26/04/25.
//

import SwiftUI

struct BaseConverterView: View {
    
    @State private var selectedSystemFrom: NumberSystem? = nil
    @State private var selectedSystemTo: NumberSystem? = nil
    @State private var input: String = ""
    
    
    @Environment(\.verticalSizeClass) var sizeClass
    
    var convertedValue: String {
        guard let from = selectedSystemFrom, let to = selectedSystemTo else {
            return "0"
        }
        return NumberConverter.convertToRadix(input, from: from, to: to)
    }
    
    var body: some View {

        ZStack {
            Color.Background
                .ignoresSafeArea()
            VStack {
                
                inputNumberField
                
                outputConvertedResultView
                    .padding(.bottom, 24)
                
                
                radixBoxInputSystemView
                                
                radixBoxSystemToView
                
                Keyboard(typeKeyboard: $input, selectedSystemFrom: $selectedSystemFrom, selectedSystemTo: $selectedSystemTo, system: selectedSystemFrom ?? .decimal)
                
            }
            .padding()
        }
        
    }
    
    @ViewBuilder
    
    var outputConvertedResultView: some View {
        let scale: CGFloat = sizeClass == .compact ? 2.0 : 1.0

        Text(convertedValue)
            .foregroundStyle(Color.Text.secondary)
            .font(.courierPrimeBold(size: 36 * scale))
            .padding(.horizontal, 16)
    }
    
    
    var inputNumberField: some View {
        VStack(spacing: 6) {
            ZStack(alignment: .leading) {
                if input.isEmpty {
                    Text("Enter number to convert..")
                        .foregroundColor(Color.Text.tertiary.opacity(0.6))
                        .font(.courierPrimeBold(size: 18))
                        .frame(maxWidth: .infinity)
                    
                }
                
                TextField("", text: $input)
                    .foregroundStyle(Color.Text.tertiary)
                    .font(.courierPrimeBold(size: 20))
                    .multilineTextAlignment(.center)
                    .disabled(true)
                    .onChange(of: input) {
                        if selectedSystemFrom == .decimal {
                            input = ValidateInputTextField().cleanDecimalInput(input)
                        }
                    }
            }
            
            Image(systemName: "arrow.down")
                .foregroundStyle(.white)
                .padding(.top, 22)
                .bold()

        }
        .padding()
        .frame(maxWidth: .infinity)
        
    }
    
    
    var radixBoxInputSystemView: some View {
        HStack(spacing: 2) {
            ForEach(NumberSystem.allCases, id: \.self) { system in
                BoxRadixSystemView(titleSystemNumber: String(localized: system.title), isSelected: self.selectedSystemFrom == system)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.selectedSystemFrom = system
                            self.input = ""
                        }
                    }
            }
        }
        
    }
    
    var radixBoxSystemToView: some View {
        VStack {
            
            HStack(spacing: 4) {
                ForEach(NumberSystem.allCases.filter { $0 != selectedSystemFrom }, id: \.self) { system in
                    let isDisabled = system == selectedSystemFrom
                    BoxRadixSystemView(titleSystemNumber: String(localized: system.title), isSelected: self.selectedSystemTo == system)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                if !isDisabled {
                                    self.selectedSystemTo = system
                                }
                            }
                        }
                }
            }
        }
        .padding()
        
    }
    
}

#Preview {
    BaseConverterView()
}

