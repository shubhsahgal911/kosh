//
//  NoOpAnalytics.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 14/10/26.
//

import Foundation

public struct NoOpAnalytics: AnalyticsService {
    public init() {}
    public func track(event: AnalyticsEvent) {}
}
