// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KoshAppKit",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Networking",
            targets: ["Networking"]
        ),
        .library(
            name: "Domain",
            targets: ["Domain"]
        ),
        .library(
            name: "Data",
            targets: ["Data"]
        ),
        .library(
            name: "LoginFeature",
            targets: ["LoginFeature"]
        ),
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        ),
    ],
    targets: [
        .target(name: "Networking"),
        .target(name: "Domain"),
        .target(name: "Data", dependencies: ["Domain", "Networking"]),
        .target(name: "DesignSystem"),
        .target(name: "LoginFeature", dependencies: ["Domain", "DesignSystem"]),

        .target(name: "TestSupport", dependencies: ["Domain"], path: "Tests/TestSupport"),
        .testTarget(name: "NetworkingTests", dependencies: ["Networking"]),
        .testTarget(name: "DomainTests", dependencies: ["Domain", "TestSupport"]),
        .testTarget(name: "DataTests", dependencies: ["Data", "Domain", "Networking", "TestSupport"]),
        .testTarget(name: "LoginFeatureTests", dependencies: ["LoginFeature", "Domain", "TestSupport"]),
    ]
)
