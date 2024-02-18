// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DevRushNetworking",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "DevRushNetworking", targets: ["DevRushNetworking"]),
    ],
    targets: [
        .target(name: "SessionWorker"),
        .target(name: "Endpoint"),
        .target(
            name: "DevRushNetworking",
            dependencies: [
                "Endpoint",
                "SessionWorker"
            ]),
        .testTarget(
            name: "DevRushNetworkingTests",
            dependencies: ["DevRushNetworking"]),
    ]
)
