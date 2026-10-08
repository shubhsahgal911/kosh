//
//  ContentView.swift
//  KoshApp
//
//  Created by Shubham Sahgal on 06/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 12) {
                    Image(systemName: "indianrupeesign.circle.fill")
                        .font(.system(size: 64))
                        .foregroundStyle(Color("BrandPrimary"))
                    Text("Kosh")
                        .font(.largeTitle.bold())
                    Text("S2 — project shell")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
    }
}

#Preview {
    ContentView()
}
