import ProjectDescription

let appName = "TestCLI"
let bundleId = "com.freniche"
let organizationName = "Diego Freniche"

let destinationFolder = "~"


let project = Project(
    name: appName,
    organizationName: organizationName,
    targets: [
        Target(
            name: appName,
            platform: .macOS,
            product: .commandLineTool,
            bundleId: bundleId,
            deploymentTarget: .macOS(targetVersion: "10.14"),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: [
            ],
            scripts: [
                // Script that will run after building and will copy our binary to ``destinationFolder``

                TargetScript.post(script: "cp $BUILT_PRODUCTS_DIR/\(appName) \(destinationFolder)",
                                  name: "Copy Binary",
                                  shellPath: "/bin/bash")
            ],
            dependencies: [
                .external(name: "ANSITerminal"),
                .external(name: "ArgumentParser"),
                .external(name: "SwiftFigletKit"),
                .external(name: "Files")
            ]
        )
    ]
//    schemes: [
//        Scheme(
//            name: appName,
//            shared: true,
//            buildAction: .buildAction(targets: [appName]),
//            testAction: .targets(["AppTests"]),
//            runAction: .runAction(executable: appName)
//        ),
//        Scheme(
//            name: "App-Release",
//            shared: true,
//            buildAction: .buildAction(targets: [appName]),
//            runAction: .runAction(executable: appName)
//        )
//    ],
//    additionalFiles: [
//        "Dangerfile.swift",
//        "Documentation/**",
//        .folderReference(path: "Website")
//    ]
)


//import ProjectDescription
//import ProjectDescriptionHelpers
//
//// Change here the name of your App and run "tuist generate"
//// The App, Scheme and Target will all be named the same
//// Better not to use spaces here
//let appName = "TestCLI"
//let organizationName = "Diego Freniche"
//let bundleId = "com.freniche"
//let destinationFolder = "~"
//
//let target = Target(name: appName,
//                    platform: .macOS,
//                    product: .commandLineTool,
//                    bundleId: bundleId,
//                    deploymentTarget: .macOS(targetVersion: "10.13"),
//                    infoPlist: .default,
//                    sources: [
//                        "Sources/**"
//                    ],
//                    dependencies: [
//                        .package(product: "ANSITerminal"),
//                        .package(product: "ArgumentParser"),
//                        .package(product: "SwiftFigletKit"),
//                        .package(product: "Files")
//                    ]
//)
//
//// Reference to above target
//let targetReference = TargetReference(stringLiteral: appName)
//
//// Script that will run after building and will copy our binary to ``destinationFolder``
//let copyBinaryScriptAfterBuilding = ExecutionAction(title: "Copy Binary",
//                                                    scriptText: "cp $BUILT_PRODUCTS_DIR/\(appName) \(destinationFolder)",
//                                                    target: targetReference)
//let scheme = Scheme(name: appName,
//                    shared: true,
//                    buildAction: .buildAction(targets: [targetReference], postActions: [copyBinaryScriptAfterBuilding]),
//                    runAction: .runAction(configuration: .debug,
//                                          executable: targetReference))
//
//let prj = Project(name: appName,
//                  organizationName: organizationName,
//                  packages: [
//                    .package(url: "https://github.com/apple/swift-argument-parser", from: .upToNextMajor("1.1.4")),
//                    .package(url: "https://github.com/JohnSundell/Files", from: "4.0.0"),
//                    .package(url: "https://github.com/pakLebah/ANSITerminal", from: "0.0.3"),
//                    .package(url: "https://github.com/dfreniche/SwiftFiglet", from: "0.2.1")
//                  ],
//                  targets: [
//                    target
//                  ],
//                  schemes: [scheme]
//)
