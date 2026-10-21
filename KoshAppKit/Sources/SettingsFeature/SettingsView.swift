//
//  SettingsView.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 16/10/26.
//
import SwiftUI

public struct SettingsView: View {
    
    private let onOpenCardsControl: @MainActor () -> Void
    private let onOpenOffers: @MainActor () -> Void
    public init(onOpenCardsControl: @escaping @MainActor () -> Void, onOpenOffers: @escaping @MainActor () -> Void) {
        self.onOpenCardsControl = onOpenCardsControl
        self.onOpenOffers = onOpenOffers
    }
    
    public var body: some View {
        List {
            Section("Cards") {
                Button("Open Cards", systemImage: "creditcard") { onOpenCardsControl() }
            }
            Section("Explore") {
                Button("Open Cards", systemImage: "tag") { onOpenOffers() }
            }
        }
        .navigationTitle("Settings")
    }
}
