//
//  ExpenseView.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 16/10/26.
//
import Foundation
import SwiftUI

public struct ExpenseView: View {
    public init(){}
    public var body: some View {
        ContentUnavailableView("Expenses", image: "list.bullet.rectangle", description: Text("Coming soon")).navigationTitle(Text("Expenses"))
    }
}
