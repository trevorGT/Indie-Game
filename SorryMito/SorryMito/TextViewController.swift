//
//  ImageViewController.swift
//  SorryMito
//
//  Created by 蒋国太 on 14/10/23.
//  Copyright (c) 2014年 trevor. All rights reserved.
//

import UIKit

class TextViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var m_txText: UITextView!
    
    @IBAction func handlePressNextBtn() {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.sText = m_txText.text
        
        LoadFromUrl()
        
        let myStoryBoard = self.storyboard
        let anotherView:CollectionViewController = myStoryBoard?.instantiateViewControllerWithIdentifier("collectionID") as CollectionViewController
        self.presentViewController(anotherView, animated: true, completion: nil)
       
        SendMsgToWeChatViewController.copyPasteboard(m_txText.text)
        appDelegate.sText = m_txText.text
        println(m_txText.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        m_txText.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent) {
        if (motion == UIEventSubtype.MotionShake) {
            NSLog("shake on ImageViewController")
        }
    }
    
    func LoadFromUrl() {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        //NSLog(appDelegate.sText!)
        
        var strCN:String = appDelegate.sText!
        let strUtf8 = strCN.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        strCN = strUtf8!;
        var url =  NSURL(string: "http://157.7.205.205:8080/sorry/getImg?info=\(strCN)")
        var str:String = NSString.stringWithContentsOfURL(url, encoding:0x80000632, error: nil)
        //NSLog(str)
        
        var myArray = str.componentsSeparatedByString("|")
       
        appDelegate.aUrl = myArray
    }
}