//
//  DashboardView.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 15/10/26.
//

import SwiftUI
import KoshDomain

public struct DashboardView: View {

    @StateObject private var viewModel: DashboardViewModel
    private let onAddExpense: @MainActor () -> Void
    private let onSelectExpense: @MainActor (Expense.ID) -> Void

    public init(
        viewModel: @autoclosure @escaping () -> DashboardViewModel,
        onAddExpense: @autoclosure @escaping @MainActor () -> Void,
        onSelectExpense: @escaping @MainActor (Expense.ID) -> Void
    ) {
        _viewModel = StateObject(wrappedValue: viewModel())
        self.onAddExpense = onAddExpense
        self.onSelectExpense = onSelectExpense
    }

    public var body: some View {
        content.navigationTitle("Home").toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Add expense", systemImage: "plus") {
                    onAddExpense()
                }
            }
        }.task {
            await viewModel.load()
        }.refreshable {
            await viewModel.load()
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .failed(let message):
            ContentUnavailableView("Something went wrong", image: "exclamationmark.triangle", description: Text(message))
        case .loaded(let expenses):
            List(expenses) { expense in
                Button(
                    action: {
                        onSelectExpense(expense.id)
                    },
                    label: {
                        ExpenseRow(expense: expense)
                    })
            }
        }
    }
}

private struct ExpenseRow: View {
    let expense: Expense
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(expense.merchant)
                Text("\(expense.category.title) : \(expense.date.formatted(date: .abbreviated, time: .omitted))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            Text("-\(expense.money.formatted())")
                .monospacedDigit()
        }.contentShape(Rectangle())
    }
}
