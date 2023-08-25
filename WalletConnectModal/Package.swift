// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-wallet-connect-modal",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15)
    ],
    products: [
        .library(
            name: "WalletConnectModal",
            targets: ["WalletConnectModal"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/WalletConnect/WalletConnectSwiftV2",
            branch: "remove-wcm" // This is branch which has wcm already removed so we don't have to worry about target name conflicts
        ),
        .package(url: "https://github.com/WalletConnect/QRCode", from: "14.3.1")
    ],
    targets: [
        .target(
            name: "WalletConnectModal",
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
            name: "WalletConnectModalTests",
            dependencies: ["WalletConnectModal"]
        )
    ]
)
