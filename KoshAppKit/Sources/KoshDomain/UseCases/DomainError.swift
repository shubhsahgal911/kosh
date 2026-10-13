//
//  DomainError.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 10/10/26.
//

import Foundation

public enum DomainError: Error, Sendable, Equatable {
    case emptyMerchant
    case invalidAmount
    case invalidCard
    case unauthorized
}
