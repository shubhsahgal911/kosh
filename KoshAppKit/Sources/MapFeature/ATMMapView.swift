//
//  ATMMapView.swift
//  KoshAppKit
//
//  Created by Shubham Sahgal on 08/10/26.
//

import SwiftUI

public struct ATMMapView: View {
    public init() {}
    public var body: some View {
        ContentUnavailableView("ATM nearby", image: "mappin.and.ellipse", description: Text("Coming soon"))
            .navigationTitle(Text("ATMs"))
    }
}
