//
//  LargeViewController.swift
//  SorryMito
//
//  Created by 蒋国太 on 14/10/26.
//  Copyright (c) 2014年 trevor. All rights reserved.
//

import UIKit

class LargeViewController: UIViewController {
    var strUrl:String?
    @IBOutlet weak var m_imgCur: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var img = NSURL(string: strUrl!)
        var data:NSData = NSData.dataWithContentsOfURL(img, options: NSDataReadingOptions.UncachedRead, error: nil)
        
        var imageBig = UIImage(data: data)
        let sizeThumb = CGSize(width: 256, height: 386)
        
        var imageThumb = SendMsgToWeChatViewController.compressImageWith(imageBig, width:256, height:386)

        m_imgCur.contentMode = UIViewContentMode.Center
        m_imgCur.image = imageThumb
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(sender:UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func weChatAction(sender:UIButton)
    {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        println(appDelegate.sText)
        //SendMsgToWeChatViewController.copyPasteboard(appDelegate.sText!)
        appDelegate.SendMegToWeChat(self.strUrl!)
    }
}