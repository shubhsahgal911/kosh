//
//  ExpenseDetailView.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 16/10/26.
//

import SwiftUI

public struct ExpenseDetailView: View {
    private let expenseID: UUID
    
    public init(expenseID:UUID) {
        self.expenseID = expenseID
    }
    
    public var body: some View {
        ContentUnavailableView("Expense Details", image: "doc.text", description: Text("Coming soon")).navigationTitle(Text("\(expenseID.uuidString)"))
            .navigationTitle("Expense Details")
            .navigationBarTitleDisplayMode(.inline)
    }
}
