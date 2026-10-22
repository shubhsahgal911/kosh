//
//  AppContainer.swift
//  KoshApp
//
//  Created by Shubham Sahgal on 17/10/26.
//

import KoshDomain
import KoshData
import DashboardFeature

@MainActor
public final class AppContainer {
    let router = AppRouter()

    lazy var analytics: any AnalyticsService = NoOpAnalytics()
    lazy var expenseRepository: any ExpenseRepository = SeededExpenseRepository.sample()

    func makeAddExpense() -> AddExpenseUseCase {
        .init(
            repository: expenseRepository,
            analytics: analytics
        )
    }

    func makeSearchExpense() -> SearchExpensesUseCase {
        .init(
            repository: expenseRepository,
            analytics: analytics
        )
    }

    func makeDashboardViewModel() -> DashboardViewModel {
        .init(
            searchExpenses: makeSearchExpense()
        )
    }
}
