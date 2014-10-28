//
//  CustomCollectionViewCell.swift
//  SorryMito
//
//  Created by 蒋国太 on 14/10/25.
//  Copyright (c) 2014年 trevor. All rights reserved.
//

import Foundation
class CustomColletionViewCell : UICollectionViewCell {
    //@IBOutlet weak var backgroundImage: UIImageView!
    let imageView: UIImageView!
    var strUrl:String?
    
    func loadItem(url: String) {
        strUrl = url;
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        println(frame.size.width)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        contentView.addSubview(imageView)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func didReceiveNearPeopleResults(results: NSDictionary) {
        var full_url = "http://www.baidu.com/img/bdlogo.png"
        var url = NSURL.URLWithString(full_url)
        var image: UIImage?
        var request: NSURLRequest = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            image = UIImage(data: data)
            self.imageView.image = image
            
        })
    }
}