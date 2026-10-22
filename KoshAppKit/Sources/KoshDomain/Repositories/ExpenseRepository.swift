//
//  ExpenseRepository.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 10/10/26.
//

import Foundation

public protocol ExpenseRepository: Sendable {
    func add(_ expense: Expense) async throws
    func search(_ text: String, category: ExpenseCategory?) async throws -> [Expense]
    func expenses(_ interval: DateInterval) async throws -> [Expense]
}
