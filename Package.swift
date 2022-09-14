// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Signer",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Signer",
            targets: ["Signer"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pengpengliu/BIP32", branch: "master"),
        .package(url: "https://github.com/pengpengliu/BIP39", branch: "master"),
        .package(url: "https://github.com/pengpengliu/Crypto101", branch: "master"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Signer",
            dependencies: [
                .byName(name: "BIP32"),
                .byName(name: "BIP39"),
                .byName(name: "Crypto101")
            ]),
        .testTarget(
            name: "SignerTests",
            dependencies: ["Signer"]),
    ]
)
