//
//  AnalyticsSpy.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 13/10/26.
//

import Foundation
import KoshDomain

public final class AnalyticsSpy: AnalyticsService, @unchecked Sendable {
    private var recorded: [AnalyticsEvent] = []
    
    public init() {
        //empty
    }
    
    public var events: [AnalyticsEvent] = []
    public func track(event: AnalyticsEvent) {
        recorded.append(event)
    }
    
    
}
