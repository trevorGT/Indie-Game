//
//  CustomTableViewCell.swift
//  SorryMito
//
//  Created by 蒋国太 on 14/10/25.
//  Copyright (c) 2014年 trevor. All rights reserved.
//

import Foundation

class CustomTableViewCell : UITableViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    
    func loadItem(image: String) {
        var img = NSURL(string: image)
        var data:NSData = NSData.dataWithContentsOfURL(img, options: NSDataReadingOptions.UncachedRead, error: nil)
        
        var imageBig = UIImage(data: data)
        let sizeThumb = CGSize(width: 256, height: 256)
        
        var imageThumb = SendMsgToWeChatViewController.compressImageWith(imageBig, width:256, height:256)
        
        backgroundImage.contentMode = UIViewContentMode.Center
        backgroundImage.image = imageThumb
    }
}