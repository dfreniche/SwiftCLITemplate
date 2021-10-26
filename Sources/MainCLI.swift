import Foundation
import ANSITerminal
import ArgumentParser
import Files
import SwiftFigletKit


@main
struct MainCLI: ParsableCommand {
    @Flag(name: [.customLong("flag"), .customShort("f")],
          help: "Just a flag, use with --flag or -f")
    var flag = false
    
    func run() throws {
    }
}
