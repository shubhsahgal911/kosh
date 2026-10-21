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
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView(container: appDelegate.container, router: appDelegate.container.router)
        }
    }
}
