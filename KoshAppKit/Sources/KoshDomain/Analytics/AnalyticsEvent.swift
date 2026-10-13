//
//  AnalyticsEvent.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 10/10/26.
//

import Foundation

public enum AnalyticsEvent: Sendable, Equatable {
    case login(method:String)
    case expenseAdded(category: String)
}

public protocol AnalyticsService: Sendable {
    func track(event: AnalyticsEvent)
}
