//
//  MoneyTests.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 14/10/26.
//

import XCTest
@testable import KoshDomain

final class MoneyTests: XCTestCase {

    func test_decimalFromString_addsExactly() {
        // Build Decimals from strings. `let d: Decimal = 0.1` goes through Double first
        // and can pick up binary rounding error, which is why money code avoids float literals.
        let sum = Decimal(string: "0.1")! + Decimal(string: "0.2")!
        XCTAssertEqual(sum, Decimal(string: "0.3")!)
    }

    func test_currencyCode_isUppercased() {
        XCTAssertEqual(Money(amount: 1, currency: "inr").currency, "INR")
    }

    func test_isPositive() {
        XCTAssertTrue(Money.init(1).isPositive)
        XCTAssertFalse(Money.init(0).isPositive)
        XCTAssertFalse(Money.init(-5).isPositive)
    }

    func test_formatted_usesIndianDigitGrouping() {
        let text = Money.init(125_000).formatted(locale: Locale(identifier: "en_IN"))
        XCTAssertTrue(text.contains("1,25,000"), "Got \(text)")   // lakh grouping, not 125,000
    }
}
