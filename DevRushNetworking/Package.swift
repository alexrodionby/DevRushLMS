// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DevRushNetworking",
    products: [
        .library(name: "DevRushNetworking", targets: ["DevRushNetworking"]),
    ],
    targets: [
        .target(
            name: "DevRushNetworking"),
        .testTarget(
            name: "DevRushNetworkingTests",
            dependencies: ["DevRushNetworking"]),
    ]
)
