//
//  BaseConverterCoordinator.swift
//  Radix
//
//  Created by Jonathan Mora on 16/07/25.
//
import SwiftUI

enum SheetDestination: Identifiable {
    var id: String {
        switch self {
        case .menu: "menu"
        }
    }
    case menu

}

struct BaseConverterCoordinator: View {
    
    @State var router: Router = .init()
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            BaseConverterView()
        }
        .environment(router)
    }
    
}
#Preview {
    BaseConverterCoordinator(router: .init())
}
