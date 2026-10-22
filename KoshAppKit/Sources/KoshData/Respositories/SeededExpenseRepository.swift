//
//  SeededExpenseRepository.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 14/10/26.
//

import Foundation
import KoshDomain

public actor SeededExpenseRepository: ExpenseRepository {
    private var items: [Expense]

    public init(items: [Expense]) {
        self.items = items
    }

    public static func sample(now: Date = .now) -> SeededExpenseRepository {
            let day: TimeInterval = 86_400
            return SeededExpenseRepository(items: [
                Expense(merchant: "Swiggy", money: Money.inr(420), category: ExpenseCategory.food, date: now),
                Expense(merchant: "Uber", money: Money.inr(310), category: .travel, date: now.addingTimeInterval(-2 * 3600)),
                Expense(merchant: "Amazon", money: .inr(2_499), category: .shopping, date: now.addingTimeInterval(-day)),
                Expense(merchant: "BESCOM", money: .inr(1_860), category: .bills, date: now.addingTimeInterval(-2 * day))
            ])
        }

    public func add(_ expense: Expense) async throws {
        items.append(expense)
    }

    public func search(_ text: String, category: ExpenseCategory?) async throws -> [Expense] {
        items.filter { expense in
            (text.isEmpty || expense.merchant.localizedCaseInsensitiveContains(text) && category == nil || expense.category == category)
        }
    }

    public func expenses(_ interval: DateInterval) async throws -> [Expense] {
        items.filter { interval.contains($0.date) }
    }
}
