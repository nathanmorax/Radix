//
//  RadixApp.swift
//  Radix
//
//  Created by Jonathan Mora on 26/04/25.
//

import SwiftUI

@main
struct RadixApp: App {
    @State var router: Router = .init()
    var body: some Scene {
        WindowGroup {
            BaseConverterCoordinator()

        }
    }
}
