//
//  RadixTests.swift
//  RadixTests
//
//  Created by Jonathan Mora on 30/06/25.
//

import Testing
@testable import Radix

struct RadixTests {
    
    @Test func testBinaryToDecimalConversion() {
        let result = NumberConverter.convertToRadix("1010", from: .binary, to: .decimal)
        #expect(result == "10")
    }
    
    @Test func testDecimalToHexConversion() {
        let result = NumberConverter.convertToRadix("255", from: .decimal, to: .hexadecimal)
        #expect(result == "FF")
    }
    
    @Test func testInvalidInputReturnsZero() {
        let result = NumberConverter.convertToRadix("XYZ", from: .hexadecimal, to: .decimal)
        #expect(result == "0")
    }

    @Test func testSystemSwap() {
        let (newInput, newFrom, newTo) = KeyboardLogic.swapSystems(
            input: "10",
            selectedSystemFrom: .decimal,
            selectedSystemTo: .binary
        )
        #expect(newInput == "1010")
        #expect(newFrom == .binary)
        #expect(newTo == .decimal)
    }

    @Test func testCleanDecimalInputWithLeadingZero() {
        let cleaned = ValidateInputTextField().cleanDecimalInput("0123")
        #expect(cleaned == "123")
    }

    @Test func testCleanDecimalInputSingleZero() {
        let cleaned = ValidateInputTextField().cleanDecimalInput("0")
        #expect(cleaned == "")
    }
    
    @Test func testValidKeysForHexadecimal() {
        let keys = NumberSystem.hexadecimal.validKeys
        #expect(keys.contains("F"))
    }
    
    @Test func testTitleForBinary() {
        let title = NumberSystem.binary.title
        #expect(title == "Binary")
    }

    
    @Test func testAllRadixValues() {
        #expect(NumberSystem.binary.radix == 2)
        #expect(NumberSystem.decimal.radix == 10)
        #expect(NumberSystem.octal.radix == 8)
        #expect(NumberSystem.hexadecimal.radix == 16)
    }
    
    @Test func testAllValidKeys() {
        #expect(NumberSystem.binary.validKeys == ["1", "0"])
        #expect(NumberSystem.decimal.validKeys.contains("9"))
        #expect(NumberSystem.octal.validKeys.contains("7"))
        #expect(NumberSystem.hexadecimal.validKeys.contains("F"))
    }
    
    @Test func testAllTitles() {
        #expect(NumberSystem.binary.title == "Binary")
        #expect(NumberSystem.decimal.title == "Decimal")
        #expect(NumberSystem.octal.title == "Octal")
        #expect(NumberSystem.hexadecimal.title == "Hex")
    }

}
