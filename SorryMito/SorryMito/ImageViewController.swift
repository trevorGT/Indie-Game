//
//  ImageViewController.swift
//  SorryMito
//
//  Created by 蒋国太 on 14/10/23.
//  Copyright (c) 2014年 trevor. All rights reserved.
//

import UIKit
import Foundation

class ImageViewController: UIViewController {
    
    @IBOutlet weak var m_imgCur: UIImageView!
    var m_sUrlImg: NSString?
    
    
    @IBAction func handlePressSendBtn() {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        SendMsgToWeChatViewController.copyPasteboard(appDelegate.sText!)
        appDelegate.SendMegToWeChat(appDelegate.sUrl!)
        
        //var alertView = UIAlertView(title: "NOTICE", message: "COPY DONE", delegate: self, cancelButtonTitle: "confirm")
        //alertView.show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LoadFromUrl()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent) {
        if (motion == UIEventSubtype.MotionShake) {
            LoadFromUrl()
        }
    }
    
    func LoadFromUrl() {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        NSLog(appDelegate.sText!)
        
        var strCN:String = appDelegate.sText!
        let strUtf8 = strCN.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        strCN = strUtf8!;
        var url =  NSURL(string: "http://157.7.205.205:8080/getImg/kind?temp=\(strCN)")
        var str:String = NSString.stringWithContentsOfURL(url, encoding:0x80000632, error: nil)
        NSLog(str)
        
        var img = NSURL(string: str)
        var data:NSData = NSData.dataWithContentsOfURL(img, options: NSDataReadingOptions.UncachedRead, error: nil)
        
        var imageBig = UIImage(data: data)
        let sizeThumb = CGSize(width: 256, height: 256)
       
        var imageThumb = SendMsgToWeChatViewController.compressImageWith(imageBig, width:256, height:256)
        
        m_imgCur.contentMode = UIViewContentMode.Center
        m_imgCur.image = imageThumb
        appDelegate.sUrl = str
    }

}