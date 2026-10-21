//
//  OffersView.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 08/10/26.
//

import SwiftUI

public struct OffersView: View {
    private let campaign: String?
    
    public init(campaign: String? = nil) {
        self.campaign = campaign
    }
    public var body: some View {
        ContentUnavailableView("Offers", systemImage: "tag",
                                       description: Text(campaign.map { "Campaign: \($0)" } ?? "Coming soon"))
                    .navigationTitle("Offers")
    }
}
