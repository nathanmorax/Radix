//
//  RadixUITests.swift
//  RadixUITests
//
//  Created by Jonathan Mora on 30/06/25.
//

import XCTest

final class RadixUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
 /*   @MainActor
    func testBinaryToDecimalConversion() throws {
        let app = XCUIApplication()
        app.launch()

        app.otherElements["from_binary"].tap()
        app.otherElements["to_decimal"].tap()

        app.buttons["key_1"].tap()
        app.buttons["key_0"].tap()
        app.buttons["key_1"].tap()

        let result = app.staticTexts["convertedResult"]
        XCTAssertEqual(result.label, "5")
    }
    */
}
