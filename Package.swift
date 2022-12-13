// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VKDataModel",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "VKDataModel",
            targets: ["VKDataModel","FriendsModel","GroupsModel","AccountModel"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", from: Version(stringLiteral: "10.33.0"))
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "VKDataModel",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-swift")
            ]
        
        ),
        .target(
            name: "FriendsModel",
            dependencies: [
               "VKDataModel"
            ]
        
        ),
        .target(
            name: "GroupsModel",
            dependencies: [
                "VKDataModel"
            ]
        
        ),
        .target(
            name: "AccountModel",
            dependencies: [
                "VKDataModel"
            ]
        
        ),
//        .testTarget(
//            name: "VKDataMdodelTests",
//            dependencies: ["VKDataMdodel"]),
    ]
)
