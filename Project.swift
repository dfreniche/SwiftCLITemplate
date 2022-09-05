import ProjectDescription
import ProjectDescriptionHelpers

// Change here the name of your App and run "tuist generate"
// The App, Scheme and Target will all be named the same
// Better not to use spaces here
let appName = "TestCLI"
let organizationName = "Diego Freniche"
let bundleId = "com.freniche"
let destinationFolder = "~"

let target = Target(name: appName,
                    platform: .macOS,
                    product: .commandLineTool,
                    bundleId: bundleId,
                    deploymentTarget: .macOS(targetVersion: "10.1"),
                    infoPlist: .default,
                    sources: [
                        "Sources/**"
                    ],
                    dependencies: [
                        .package(product: "ANSITerminal"),
                        .package(product: "ArgumentParser"),
                        .package(product: "SwiftFigletKit"),
                        .package(product: "Files")
                    ]
)

// Reference to above target
let targetReference = TargetReference(stringLiteral: appName)

// Script that will run after building and will copy our binary to ``destinationFolder``
let copyBinaryScriptAfterBuilding = ExecutionAction(title: "Copy Binary",
                                                    scriptText: "cp $BUILT_PRODUCTS_DIR/\(appName) \(destinationFolder)",
                                                    target: targetReference)
let scheme = Scheme(name: appName, 
                    shared: true, 
                    buildAction: .buildAction(targets: [targetReference], postActions: [copyBinaryScriptAfterBuilding]),
                    runAction: .runAction(configuration: .debug,
                                          executable: targetReference))

let prj = Project(name: appName,
                  organizationName: organizationName,
                  packages: [
                    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
                    .package(url: "https://github.com/JohnSundell/Files", from: "4.0.0"),
                    .package(url: "https://github.com/pakLebah/ANSITerminal", from: "0.0.3"),
                    .package(url: "https://github.com/dfreniche/SwiftFiglet", .upToNextMajor(from: "0.2.1"))
                  ],
                  targets: [
                    target
                  ],
                  schemes: [scheme]
)
