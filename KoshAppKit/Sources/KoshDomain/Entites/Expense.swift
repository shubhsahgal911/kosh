//
//  Expense.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 07/10/26.
//

import Foundation

public struct Expense: Identifiable, Hashable, Sendable {
    public let id: UUID
    public var merchant: String
    public var money: Money
    public var category: ExpenseCategory
    public var date: Date
    public var cardLast4: String?
    public var latitude: Double?
    public var longitude: Double?
    public var placeName: String?

    // Swift only generates an `internal` memberwise init.
    // Other modules need this explicit `public` one.
    public init(
        id: UUID = UUID(),
        merchant: String,
        money: Money,
        category: ExpenseCategory,
        date: Date = .now,
        cardLast4: String? = nil,
        latitude: Double? = nil,
        longitude: Double? = nil,
        placeName: String? = nil
    ) {
        self.id = id
        self.merchant = merchant
        self.money = money
        self.category = category
        self.date = date
        self.cardLast4 = cardLast4
        self.latitude = latitude
        self.longitude = longitude
        self.placeName = placeName
    }

    public var coordinate: Coordinate? {
        guard let latitude, let longitude else { return nil }
        return Coordinate(latitude: latitude, longitude: longitude)
    }
}
