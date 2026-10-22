//
//  AddExpenseUseCase.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 10/10/26.
//

import Foundation

public struct AddExpenseUseCase: Sendable {
   private let repository: ExpenseRepository
   private let analytics: AnalyticsService

    public init(repository: ExpenseRepository, analytics: AnalyticsService) {
        self.repository = repository
        self.analytics = analytics
    }

    public func execute(expense: Expense) async throws -> Expense {
        var expense = expense
        expense.merchant = expense.merchant.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !expense.merchant.isEmpty else {
            throw DomainError.emptyMerchant
        }

        guard expense.money.isPositive else {
            throw DomainError.invalidAmount
        }

        try await repository.add(expense)
        analytics.track(event: .expenseAdded(category: expense.category.rawValue))
        return expense
    }
}
