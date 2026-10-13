//
//  ExpenseCategory.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 10/10/26.
//

import Foundation

public enum ExpenseCategory:String, Sendable, Hashable, CaseIterable, Codable, Identifiable {
    case food, travel, bills, shopping, health
    
    public var id: String { rawValue }
    
    public var title: String { rawValue.capitalized }
}
