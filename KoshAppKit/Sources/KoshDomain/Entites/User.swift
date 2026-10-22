//
//  File.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 07/10/26.
//

import Foundation

public struct User: Identifiable, Hashable, Sendable {
    public let id: Int
    public let username: String
    public let firstName: String
    public let lastName: String
    public let avatarURL: URL?

    public init(id: Int, username: String, firstName: String, lastName: String, avatarURL: URL?) {
        self.id = id
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.avatarURL = avatarURL
    }

    public var displayName: String { "\(firstName) \(lastName)" }
}
