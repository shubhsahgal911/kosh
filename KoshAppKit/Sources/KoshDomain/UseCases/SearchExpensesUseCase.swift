//
//  SearchExpensesUseCase.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 10/10/26.
//

import Foundation

public struct SearchExpensesUseCase: Sendable {
    private let repository: ExpenseRepository
    private let analytics: AnalyticsService
    
    public init(repository: ExpenseRepository, analytics: AnalyticsService) {
        self.repository = repository
        self.analytics = analytics
    }
    
    public func execute(text: String,expenseCategory : ExpenseCategory?) async throws -> [Expense] {
        
        let query = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return try await repository.search(query, category: expenseCategory).sorted {
            $0.date > $1.date
        }
    }
}
