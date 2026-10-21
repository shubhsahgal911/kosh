//
//  AppDelegate.swift
//  KoshApp
//
//  Created by Shubham Sahgal on 21/10/26.
//

import UIKit

@MainActor
final class AppDelegate : NSObject, UIApplicationDelegate {
    let container = AppContainer()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        true
    }
}
