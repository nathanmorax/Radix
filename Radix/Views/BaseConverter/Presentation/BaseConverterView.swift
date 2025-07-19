//
//  ContentView.swift
//  Radix
//
//  Created by Jonathan Mora on 26/04/25.
//

import SwiftUI

struct BaseConverterView: View {
    
    @Environment(Router.self) private var router
    @Environment(\.verticalSizeClass) var sizeClass
    
    @State private var viewModel = BaseConverterViewModel()
    
    var body: some View {
        ZStack {
            Color.Background.ignoresSafeArea()
            VStack {
                inputNumberField
                outputConvertedResultView
                    .padding(.bottom, 24)
                
                radixBoxInputSystemView
                radixBoxSystemToView
                                
                Keyboard(
                    typeKeyboard: $viewModel.input,
                    selectedSystemFrom: $viewModel.selectedSystemFrom,
                    selectedSystemTo: $viewModel.selectedSystemTo,
                    system: viewModel.selectedSystemFrom ?? .decimal
                )
            }
            .padding()
        }
        .fullScreenCover(item: router.sheetItem) { destination in
            if let destination = destination.destination as? SheetDestination {
                switch destination {
                case .menu:
                    OptionsMenu()
                }
            }
        }
    }
    
    @ViewBuilder
    var outputConvertedResultView: some View {
        let scale: CGFloat = sizeClass == .compact ? 2.0 : 1.0
        Text(viewModel.convertedValue)
            .foregroundStyle(Color.Text.secondary)
            .accessibilityIdentifier("convertedResult")
            .font(.courierPrimeBold(size: 36 * scale))
            .padding(.horizontal, 16)
    }
    
    var inputNumberField: some View {
        VStack(spacing: 6) {
            ZStack(alignment: .leading) {
                if viewModel.input.isEmpty {
                    Text("Enter number to convert..")
                        .foregroundColor(Color.Text.tertiary.opacity(0.6))
                        .font(.courierPrimeBold(size: 18))
                        .frame(maxWidth: .infinity)
                }
                
                TextField("", text: $viewModel.input)
                    .accessibilityIdentifier("inputTextField")
                    .foregroundStyle(Color.Text.tertiary)
                    .font(.courierPrimeBold(size: 20))
                    .multilineTextAlignment(.center)
                    .disabled(true)
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
                BoxRadixSystemView(
                    titleSystemNumber: String(localized: system.title),
                    isSelected: viewModel.selectedSystemFrom == system
                )
                .accessibilityIdentifier("from_\(system)")
                .accessibilityLabel("Select \(system.title) as source system")
                .accessibilityHint("Tap to convert from \(system.title)")
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        viewModel.selectedSystemFrom = system
                    }
                }
            }
        }
    }
    
    var radixBoxSystemToView: some View {
        VStack {
            HStack(spacing: 4) {
                ForEach(NumberSystem.allCases.filter { $0 != viewModel.selectedSystemFrom }, id: \.self) { system in
                    let isDisabled = system == viewModel.selectedSystemFrom
                    BoxRadixSystemView(
                        titleSystemNumber: String(localized: system.title),
                        isSelected: viewModel.selectedSystemTo == system
                    )
                    .accessibilityIdentifier("to_\(system)")
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            if !isDisabled {
                                viewModel.selectedSystemTo = system
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}


struct OptionsMenu: View {
    @Environment(Router.self) private var router
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    KeyView(isRound: true, action: {
                        router.dismissSheet()
                    }, key: "", systemImage: "house")
                }
                .padding()
                
                Spacer()
                
                VStack {
                    Text("Options Menu")
                    Text("Options Menu")
                    Text("Options Menu")
                    Text("Options Menu")
                }
                .foregroundColor(Color.Text.tertiary.opacity(0.6))
                .font(.courierPrimeBold(size: 18))
                .frame(maxWidth: .infinity)
                .frame(maxWidth: 200)
                
                Spacer()
                
            }
        }
    }
}
