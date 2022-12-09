// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AoC2022",
    platforms: [.macOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AoC2022",
            targets: ["AoC2022"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AoC2022",
            dependencies: [],
            resources: [
                .copy("Day9/Resources/Day9.txt"),
                .copy("Day8/Resources/Day8.txt"),
                .copy("Day7/Resources/Day7.txt"),
                .copy("Day6/Resources/Day6.txt"),
                .copy("Day5/Resources/Day5.txt"),
                .copy("Day4/Resources/Day4.txt"),
                .copy("Day3/Resources/Day3.txt"),
                .copy("Day2/Resources/Day2.txt"),
                .copy("Day1/Resources/Day1.txt"),
            ]),
        .testTarget(
            name: "AoC2022Tests",
            dependencies: ["AoC2022"]),
    ]
)










