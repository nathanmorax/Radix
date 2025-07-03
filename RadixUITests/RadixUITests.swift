//
//  RadixUITests.swift
//  RadixUITests
//
//  Created by Jonathan Mora on 30/06/25.
//

import XCTest

final class RadixUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

}
