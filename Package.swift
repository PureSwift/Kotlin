// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Kotlin",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .library(
            name: "Kotlin",
            targets: ["Kotlin"]
        ),
        .library(
            name: "KotlinJVM",
            targets: ["KotlinJVM"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/PureSwift/swift-java.git",
            branch: "feature/android"
        ),
        .package(
            url: "https://github.com/PureSwift/JavaLang.git",
            branch: "master"
        )
    ],
    targets: [
        .target(
            name: "Kotlin"
        ),
        .target(
            name: "KotlinJVM",
            dependencies: [
                .product(
                    name: "SwiftJava",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaIO",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaNet",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaUtilFunction",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaLangReflect",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaLang",
                    package: "JavaLang"
                ),
                .product(
                    name: "JavaLangUtil",
                    package: "JavaLang"
                ),
                "Kotlin"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
            ]
        ),
        .testTarget(
            name: "KotlinTests",
            dependencies: ["Kotlin"]
        )
    ]
)
