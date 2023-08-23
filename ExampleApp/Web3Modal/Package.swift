// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Web3Modal",
    platforms: [
        .iOS(.v15),
        .macOS(.v13),
        .tvOS(.v15)
    ],
    products: [
        .library(
            name: "Web3Modal",
            targets: ["Web3Modal"]
        ),
        .library(
            name: "WCModal",
            targets: ["WCModal"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/WalletConnect/WalletConnectSwiftV2",
            .upToNextMajor(from: "1.6.17")
        ),
        .package(url: "https://github.com/WalletConnect/QRCode", from: "14.3.1")
    ],
    targets: [
        .target(
            name: "Web3Modal",
            dependencies: [
                .product(
                    name: "WalletConnect",
                    package: "WalletConnectSwiftV2"
                )
            ]
        ),
        .target(
            name: "WCModal",
            dependencies: [
                "QRCode",
                .product(
                    name: "WalletConnect",
                    package: "WalletConnectSwiftV2"
                )
            ],
            exclude: ["Secrets/secrets.json.sample"],
            resources: [
                .copy("Secrets/secrets.json"),
                .copy("Resources/Assets.xcassets")
            ]
        ),

        // MARK: - Test Targets

        .testTarget(
            name: "Web3ModalTests",
            dependencies: ["Web3Modal"]
        ),
        .testTarget(
            name: "WCModalTests",
            dependencies: ["WCModal"]
        )
    ]
)
