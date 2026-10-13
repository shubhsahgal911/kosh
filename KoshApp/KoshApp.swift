//
//  KoshAppApp.swift
//  KoshApp
//
//  Created by Shubham Sahgal on 06/10/26.
//

import SwiftUI
import KoshNetworking
import GoogleMapsSupport
@main
struct KoshApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().onAppear {
                print("Almofire Version:\(KoshNetworking.version) | Google Version:\(GoogleMapsSupportModule.sdkVersion)")
            }
        }
    }
}
