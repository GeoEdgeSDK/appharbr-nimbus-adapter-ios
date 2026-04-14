// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AppHarbrNimbusAdapter",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "AppHarbrNimbusAdapter",
            targets: ["AppHarbrNimbusAdapterKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/adsbynimbus/nimbus-ios-sdk", .upToNextMinor(from: "2.33.0")),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", from: "1.23.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", "12.0.0"..<"14.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "AppHarbrNimbusAdapter",
            url: "https://geoedge-rum.s3.us-east-1.amazonaws.com/sdk/released_versions/ios-deployment/AppHarbrNimbusAdapter-iOS-2.33.0.0.zip",
            checksum: "286e2e13f5e3fd1fecd0f213e055e883161fc0bb39379109bbe20b43f83a9655"
        ),
        .target(
            name: "AppHarbrNimbusAdapterKit",
            dependencies: [
                "AppHarbrNimbusAdapter",
                .product(name: "NimbusKit", package: "nimbus-ios-sdk"),
                .product(name: "AppHarbrSDK", package: "AppHarbrSDK"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
            ],
            path: "AppHarbrNimbusAdapter",
            sources: ["Sources"]
        ),
    ]
)
