import Foundation
import ANSITerminal
import ArgumentParser
import Files
import SwiftFigletKit

// Sample Main Entry Point for your CLI app
// This is the sync version (not using async calls in code)
@main
struct MainCLI: ParsableCommand {
    @Flag(name: [.customLong("flag"), .customShort("f")],
          help: "Just a flag, use with --flag or -f")
    var flag = false
    
    func run() throws {
        // let's print all files in current directory!
        for f in try readFilesInDirectory() {
            print("File: \(f)")
        }
        
        for f in try readFilesInDirectory(path: "~/", includeHidden: true) {
            print("File: \(f)")
        }
    }
}
