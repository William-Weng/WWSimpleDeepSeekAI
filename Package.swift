// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWSimpleDeepSeekAI",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWSimpleDeepSeekAI", targets: ["WWSimpleDeepSeekAI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/William-Weng/WWNetworking.git", from: "1.6.2"),
    ],
    targets: [
        .target(name: "WWSimpleDeepSeekAI", dependencies: ["WWNetworking"], resources: [.copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
