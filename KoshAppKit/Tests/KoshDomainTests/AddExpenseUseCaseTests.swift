//
//  AddExpenseUseCaseTests.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 08/10/26.
//

import XCTest
@testable import KoshDomain
import TestSupport

public final class AddExpenseUseCaseTests: XCTestCase {

    public func makeSUT() -> (sut: AddExpenseUseCase, repository: InMemoryExpenseRepository, analytics: AnalyticsSpy) {
        let repository = InMemoryExpenseRepository(items: [])
        let analytics = AnalyticsSpy()
        return (AddExpenseUseCase(repository: repository, analytics: analytics), repository, analytics)
    }

    public func test_addExpense_rejectNegativeMoney() async {
        let (sut, repository, analytics) = makeSUT()

        await assertThrows(DomainError.invalidAmount) {
            try await sut.execute(expense: .fixture(amount: Decimal(-1)))
        }

        let stored = await repository.all
        XCTAssertTrue(stored.isEmpty)
        XCTAssertTrue(analytics.events.isEmpty, "No event for a failed save")
    }

    public func test_addExpense_rejectBlankMerchant() async {
        let (sut, repository, analytics) = makeSUT()

        await assertThrows(DomainError.emptyMerchant) {
            try await sut.execute(expense: .fixture(merchant: "  "))
        }
        let stored = await repository.all
        XCTAssertTrue(stored.isEmpty)
        XCTAssertTrue(analytics.events.isEmpty, "No event for a failed save")
    }

    private func assertThrows(
        _ expected: DomainError,
        file: StaticString = #filePath, line: UInt = #line,
        _ work: () async throws -> Void
    ) async {
        do {
            try await work()
            XCTFail("Expected \(expected) but nothing was thrown", file: file, line: line)
        } catch {
            XCTAssertEqual(error as? DomainError, expected, file: file, line: line)
        }
    }
}

// public struct AddExpenseUseCase: Sendable {

//
//    public func addExpense(expense: Expense) async throws {
//
//        guard expense.money.isPositive else {
//            throw DomainError.invalidAmount
//        }
//
//        try await repository.add(expense)
//        analytics.track(event: .expenseAdded(category: expense.category.rawValue))
//    }
// }
