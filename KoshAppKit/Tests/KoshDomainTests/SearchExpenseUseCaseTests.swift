//
//  SearchExpenseUseCaseTests.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 14/10/26.
//

import XCTest
@testable import KoshDomain
import TestSupport

final class SearchExpensesUseCaseTests: XCTestCase {

    private let seed: [Expense] = [
        .fixture(merchant: "Uber", category: .travel, date: .day(1)),
        .fixture(merchant: "Uber Eats", category: .food, date: .day(3)),
        .fixture(merchant: "Swiggy", category: .food, date: .day(2))
    ]

    func test_search_isCaseInsensitive_trimmed_andNewestFirst() async throws {
        let sut = SearchExpensesUseCase(repository: InMemoryExpenseRepository(items: seed), analytics: AnalyticsSpy())

        let result = try await sut.execute(text: "  UB ", expenseCategory: nil)

        XCTAssertEqual(result.map(\.merchant), ["Uber Eats", "Uber"])
    }

    func test_search_filtersByCategory() async throws {
        let sut = SearchExpensesUseCase(repository: InMemoryExpenseRepository(items: seed), analytics: AnalyticsSpy())

        let result = try await sut.execute(text: "", expenseCategory: .food)

        XCTAssertEqual(result.map(\.merchant), ["Uber Eats", "Swiggy"])
    }

    func test_emptyQuery_returnsEverything_newestFirst() async throws {
        let sut = SearchExpensesUseCase(repository: InMemoryExpenseRepository(items: seed), analytics: AnalyticsSpy())

        let result = try await sut.execute(text: "", expenseCategory: nil)

        XCTAssertEqual(result.map(\.merchant), ["Uber Eats", "Swiggy", "Uber"])
    }
}
