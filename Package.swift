// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "BCKeys",
    platforms: [
        .iOS(.v14),
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "BCKeys",
            targets: ["BCKeys"]),
    ],
    dependencies: [
        .package(url: "https://github.com/WolfMcNally/WolfBase", from: "6.0.0"),
        .package(url: "https://github.com/BlockchainCommons/URKit", from: "14.0.0"),
        .package(url: "https://github.com/BlockchainCommons/BCSwiftCrypto", from: "4.0.0"),
        .package(url: "https://github.com/BlockchainCommons/BCSwiftRandom", from: "1.0.0"),
        .package(url: "https://github.com/BlockchainCommons/BCSwiftTags", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "BCKeys",
            dependencies: [
                "WolfBase",
                "URKit",
                .product(name: "BCCrypto", package: "BCSwiftCrypto"),
                .product(name: "BCRandom", package: "BCSwiftRandom"),
                .product(name: "BCTags", package: "BCSwiftTags"),
            ]
        ),
        .testTarget(
            name: "BCKeysTests",
            dependencies: ["BCKeys"]),
    ]
)
