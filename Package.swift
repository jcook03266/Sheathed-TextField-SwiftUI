// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sheathed-TextField-SwiftUI",
    platforms: [.iOS(.v16)],
    products: [.library(name: "Sheathed-TextField-SwiftUI", targets: ["Sheathed-TextField-SwiftUI"])],
    targets: [.target(name: "Sheathed-TextField-SwiftUI", path: "Sources")]
)
