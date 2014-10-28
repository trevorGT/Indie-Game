//
//  TagViewController.swift
//  SorryMito
//
//  Created by 蒋国太 on 14/10/25.
//  Copyright (c) 2014年 trevor. All rights reserved.
//

import Foundation
import UIKit

class TagViewController: UIViewController {
    var curBtn:UIButton?
    
    @IBAction func buttonAction(sender:UIButton)
    {
        if(sender != curBtn){
            curBtn?.selected = false
            curBtn?.alpha = CGFloat(1.0)
            curBtn = sender
            
            println("hello")
        }
        sender.alpha = CGFloat(0.5)
        sender.selected = true
    }
    
    @IBAction func confirmAction(sender:UIButton)
    {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        var url =  NSURL(string: "http://157.7.205.205:8080/sorry/getImgByTag?info=\(curBtn?.tag)")
        println(url)
        var str:String = NSString.stringWithContentsOfURL(url, encoding:0x80000632, error: nil)
       
        var myArray = str.componentsSeparatedByString("|")
        
        appDelegate.aUrl = myArray
    }
    
    @IBAction func backAction(sender:UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}