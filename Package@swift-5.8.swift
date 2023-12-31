// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

// The Swift Programming Language
// https://docs.swift.org/swift-book

import PackageDescription

let package = Package(
    name: "DSToast",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DSToast",
            targets: ["DSToast"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DSToast", path: "Sources", resources: [.process("Resource")]),
        .testTarget(
            name: "DSToastTests",
            dependencies: ["DSToast"]),
    ]
)
