// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

import class Foundation.FileManager
import class Foundation.ProcessInfo

// Note: the JAVA_HOME environment variable must be set to point to where
// Java is installed, e.g.,
//   Library/Java/JavaVirtualMachines/openjdk-21.jdk/Contents/Home.
func findJavaHome() -> String {
  if let home = ProcessInfo.processInfo.environment["JAVA_HOME"] {
    return home
  }

  // This is a workaround for envs (some IDEs) which have trouble with
  // picking up env variables during the build process
  let path = "\(FileManager.default.homeDirectoryForCurrentUser.path()).java_home"
  if let home = try? String(contentsOfFile: path, encoding: .utf8) {
    if let lastChar = home.last, lastChar.isNewline {
      return String(home.dropLast())
    }

    return home
  }

  fatalError("Please set the JAVA_HOME environment variable to point to where Java is installed.")
}
let javaHome = findJavaHome()

let javaIncludePath = "\(javaHome)/include"
#if os(Linux)
  let javaPlatformIncludePath = "\(javaIncludePath)/linux"
#elseif os(macOS)
  let javaPlatformIncludePath = "\(javaIncludePath)/darwin"
#elseif os(Windows)
  let javaPlatformIncludePath = "\(javaIncludePath)/win32"
#endif

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
            branch: "feature/android-shim"
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
                    name: "JavaKit",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitCollection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitIO",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitNetwork",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitFunction",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaKitReflection",
                    package: "swift-java"
                ),
                .product(
                    name: "JavaLang",
                    package: "JavaLang"
                ),
                .product(
                    name: "JavaUtil",
                    package: "JavaLang"
                ),
                "Kotlin"
            ],
            exclude: ["swift-java.config"],
            swiftSettings: [
              .swiftLanguageMode(.v5),
              .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"]),
            ]
        ),
        .testTarget(
            name: "KotlinTests",
            dependencies: ["Kotlin"]
        )
    ]
)
