//
//  StatementView.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 16/10/26.
//

import SwiftUI

public struct StatementView: View {
    public init() {}
    public var body: some View {
            ContentUnavailableView("Statements", systemImage: "doc.richtext",
                                   description: Text("Coming soon"))
                .navigationTitle("Statements")
        }
    
}
