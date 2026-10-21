//
//  AddExpenseView.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 16/10/26.
//

import SwiftUI

public struct AddExpenseView: View {
    
    private let onClose: @MainActor () -> Void
    
    public init(onClose: @escaping @MainActor () -> Void) {
        self.onClose = onClose
    }
    
    public var body: some View {
        ContentUnavailableView("New Expense", image: "plus.circle", description: Text("Coming Soon"))
            .navigationTitle("New Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .cancellationAction) {
                    Button("Cancel") {
                        onClose()
                    }
                }
            }
    }
}
