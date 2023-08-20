// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlagsKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "FlagsKit",
            targets: ["FlagsKit"]
        )
    ],
    targets: [
        .target(
            name: "FlagsKit",
            resources: [
                .process("Resources/Assets.xcassets")
            ]
        ),
        .testTarget(
            name: "FlagsKitTests",
            dependencies: ["FlagsKit"]
        )
    ]
)
