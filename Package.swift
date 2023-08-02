// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AXPhotoViewer",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "AXPhotoViewer",
            targets: ["AXPhotoViewer"]
        ),
        .library(
            name: "AXPhotoViewerObjc",
            targets: ["AXPhotoViewerObjc"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Flipboard/FLAnimatedImage.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/groveco/AXStateButton.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "AXPhotoViewer",
            dependencies: ["FLAnimatedImage", "AXStateButton", "AXPhotoViewerObjc"],
            path: "Source",
            resources: [.copy("Assets")]
        ),
        .target(
            name: "AXPhotoViewerObjc",
            dependencies: ["FLAnimatedImage"],
            path: "Objc",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("."),
            ]
        )
    ]
)
