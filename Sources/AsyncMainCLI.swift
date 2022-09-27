//
//  AsyncMainCLI.swift
//  TestCLI
//
//  Created by Diego Freniche Brito on 14/9/22.
//  Copyright © 2022 Diego Freniche. All rights reserved.
//

import Foundation
import ArgumentParser
import ANSITerminal
import AppKit
import Files


// Sample Main Entry Point for your CLI app
// This is the async version (using async calls in code to download an image)
// You need to pass the image to download as an argument to this app
@available(macOS 12.0, *)
@main
struct MyFirstCLIProject: AsyncParsableCommand {
    @Argument(help: "The image to download.")
    var imageURL: String
    
    mutating func run() async {
        print("Starting download...".blue)
        
        if let url = URL(string: imageURL) {
            
            do {
                let (data, urlResponse) = try await URLSession.shared.data(from: url)
                
                // this will print in Green using ANSI characters
                // You'll see weird chars in Xcode console, run on a real
                // Terminal
                print("Found data!".green)
                
                try showImage(data)
            } catch {
                print("Error downloading \(error)".red)
            }
            
            print("Finishing download...".blue)
        }
    }
}

func showImage(_ data: Data) throws {
    guard let _ = NSImage(data: data) else { return }
    
    let imageWithTextFile = try Folder.temporary.createFile(at: "\(UUID().description).png", contents: data)
    
    Process.launch(command: "/usr/bin/open", arguments: ["\(imageWithTextFile.path)"])
}
