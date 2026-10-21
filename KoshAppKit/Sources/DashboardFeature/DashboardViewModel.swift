//
//  DashboardViewModel.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 14/10/26.
//

import Foundation
import KoshDomain

@MainActor
public final class DashboardViewModel: ObservableObject {
    public enum State: Equatable {
        case loading
        case loaded([Expense])
        case failed(String)
    }
    
    @Published public private(set) var state: State = .loading
    
    private let searchExpenses: SearchExpensesUseCase
    
    public init(searchExpenses: SearchExpensesUseCase) {
        self.searchExpenses = searchExpenses
    }
    
    public func load() async {
     
        do {
            let all = try await searchExpenses.execute(text: "", expenseCategory: nil)
            state = .loaded(Array(all.prefix(5)))
        } catch {
            state = .failed("Couldn't load your expenses. Pull to try again.")
        }
    }
}
