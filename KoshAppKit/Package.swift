// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

extension Target.Dependency {
    static let koshDomain = Target.Dependency.target(name: "KoshDomain")
    static let networking = Target.Dependency.target(name: "KoshNetworking")
    static let data = Target.Dependency.target(name: "KoshData")
    static let ui = Target.Dependency.target(name: "KoshUI")
    static let testSupport = Target.Dependency.target(name: "TestSupport")
    static let almofire = Target.Dependency.product(name: "Alamofire", package: "Alamofire")
    static let googleMaps = Target.Dependency.product(name: "GoogleMaps", package: "ios-maps-sdk")
    static let firebaseAnalytics = Target.Dependency.product(name: "FirebaseAnalytics", package: "firebase-ios-sdk")
    static let firebaseCrashlytics = Target.Dependency.product(name: "FirebaseCrashlytics", package: "firebase-ios-sdk")
}

let features = ["AuthFeature", "DashboardFeature", "ExpensesFeature", "MapFeature", "OffersFeature", "SettingsFeature", "StatementFeature"]

let appModules = ["KoshDomain", "KoshNetworking", "KoshData", "KoshUI", "KoshPlatform", "GoogleMapsSupport"] + features



let package = Package(
    name: "KoshAppKit",
    platforms: [.iOS(.v17)],
    products: appModules.map { .library(name: $0, targets: [$0]) },
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", from: "5.10.0"),
        .package(url: "https://github.com/googlemaps/ios-maps-sdk", from: "10.0.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "12.0.0"),
    ],
    targets: [
        .target(name: "KoshDomain"),
        .target(name: "KoshData", dependencies: [.koshDomain,.networking]),
        .target(name: "KoshNetworking", dependencies: [.koshDomain, .almofire]),
        .target(name: "KoshPlatform"),
        .target(name: "KoshUI"),
        
        .target(name: "GoogleMapsSupport",dependencies: [.target(name: "MapFeature"), .googleMaps]),
        
        .target(name: "TestSupport", dependencies: [.koshDomain], path: "Tests/TestSupport"),

        .testTarget(name: "KoshNetworkingTests", dependencies: [.networking,.testSupport]),
        .testTarget(name: "KoshDomainTests", dependencies: [.koshDomain , .testSupport]),
        .testTarget(name: "KoshDataTests", dependencies: [.target(name: "KoshData"), .testSupport]),
        .testTarget(name: "AuthFeatureTests", dependencies: [.target(name: "AuthFeature"), .testSupport]),
        .testTarget(name: "ExpensesFeatureTests", dependencies: [.target(name: "ExpensesFeature"), .testSupport])
    ] + features.map {
        .target(name: $0,dependencies: [.koshDomain,.ui])
    }
)
