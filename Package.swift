// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AsyncView",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "AsyncView",
            targets: ["AsyncView"]),
    ],
    targets: [
        .target(
            name: "AsyncView",
            dependencies: []),
        .testTarget(
            name: "AsyncViewTests",
            dependencies: ["AsyncView"]),
    ]
)
