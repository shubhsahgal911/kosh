//
//  Fixtures.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 13/10/26.
//

import Foundation
import KoshDomain

public extension Date {
    static func day(_ offset: Int) -> Date {
            Date(timeIntervalSince1970: 1_790_000_000 + Double(offset) * 86_400)
        }
}

public extension Expense {

    static func fixture(
        id: UUID = UUID(),
        merchant: String = "Swiggy",
        amount: Decimal = 420,
        currency: String = "INR",
        category: ExpenseCategory = .food,
        date: Date = .day(0)
    ) -> Expense {
        Expense(
            id: id,
            merchant: merchant,
            money: Money(amount: amount, currency: currency),
            category: category,
            date: date
        )
    }
}
