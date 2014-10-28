//
//  Created by Dicky Tsang on 26/6/14.
//  Copyright (c) 2014 Dicky Tsang. All rights reserved.
//

import UIKit
import Foundation

extension UIImageView {
    func loadImage(url: String, autoCache: Bool) {
            }
}

class NSFileController : NSObject {
    var fileManager : NSFileManager = NSFileManager.defaultManager()
    func writeFile(fileDir: String, fileContent: NSData) -> Bool {
        var filePath : String = NSHomeDirectory().stringByAppendingPathComponent(fileDir)
        
        var writePointer : Bool = fileContent.writeToFile(filePath, atomically: true)
        return writePointer
    }
    
    func readFile(fileDir: String) -> NSData? {
        var filePath : String = NSHomeDirectory().stringByAppendingPathComponent(fileDir)
        var fileHandler : NSFileHandle = NSFileHandle(forReadingAtPath: filePath)
        var fileData : NSData? = fileHandler.readDataToEndOfFile()
        fileHandler.closeFile()
        return fileData
    }
    
    func mkdir(fileDir: String) -> Bool {
        var filePath : String = NSHomeDirectory().stringByAppendingPathComponent(fileDir)
        var createHandler : Bool = fileManager.createDirectoryAtPath(filePath, withIntermediateDirectories: true, attributes: nil, error: nil)
        return createHandler
    }
}
