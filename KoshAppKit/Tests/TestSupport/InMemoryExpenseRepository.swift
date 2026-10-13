//
//  InMemoryExpenseRepository.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 13/10/26.
//

import Foundation
import KoshDomain

public actor InMemoryExpenseRepository: ExpenseRepository {
    private var items: [Expense]
    public var all: [Expense] {
        return items
    }
    public init(items: [Expense] = []) {
        self.items = items
    }
    public func add(_ expense: Expense) async throws {
        items.append(expense)
    }
    
    public func search(_ text: String, category: ExpenseCategory?) async throws -> [Expense] {
        all.filter {
            (text.isEmpty || $0.merchant.localizedCaseInsensitiveContains(text)) && (category == nil && $0.category == category)
        }
    }
    
    public func expenses(_ interval: DateInterval) async throws -> [Expense] {
        return all.filter { interval.contains($0.date) }
    }
    
    
    
}
