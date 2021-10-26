//
//  FileDirectoryUtils.swift
//  FileDirectoryUtils
//
//  Created by Diego Freniche Brito on 5/8/21.
//

import Foundation
import Files

func readFoldersInDirectory() throws -> [String] {
    var folderNames: [String] = []
    
    try Folder(path: ".").subfolders.enumerated().forEach { (index, file) in
//            print("index: \(index)".blue.onWhite + " folder: \(file.name)")
        folderNames.append(file.name)
    }
    
    return folderNames
}

func readFilesInDirectory(includeHidden: Bool = false) throws -> [String] {
    var fileNames: [String] = []
    
    if includeHidden {
        try Folder(path: ".").files.includingHidden.enumerated().forEach { (index, file) in
            fileNames.append(file.name)
        }
    } else {
        try Folder(path: ".").files.enumerated().forEach { (index, file) in
            fileNames.append(file.name)
        }
    }
            
    return fileNames
}
