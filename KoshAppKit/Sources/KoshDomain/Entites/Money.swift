//
//  Money.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 07/10/26.
//

import Foundation

public struct Money: Hashable, Sendable, Codable  {
    public let amount: Decimal
    public let currency: String
    
    public init(amount: Decimal, currency: String) {
        self.amount = amount
        self.currency = currency.uppercased()
    }
    
    public init(_ amount: Decimal) {
        self.amount = amount
        self.currency = "INR"
    }
    
    public var isPositive: Bool {
        amount > 0
    }
    
    public func formatted(locale: Locale = .current) -> String {
        amount.formatted(.currency(code: currency).locale(locale))
    }
}
