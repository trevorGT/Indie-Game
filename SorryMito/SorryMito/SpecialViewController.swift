//
//  SpecialViewController.swift
//  SorryMito
//
//  Created by 蒋国太 on 14/10/26.
//  Copyright (c) 2014年 trevor. All rights reserved.
//

import UIKit

class SpecialViewController: UIViewController {
    
    @IBAction func buttonAction(sender:UIButton)
    {
        if(sender.tag == 0){
            
        }
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        var url =  NSURL(string: "http://157.7.205.205:8080/sorry/getImgByID?info=\(sender.tag)")
        var str:String = NSString.stringWithContentsOfURL(url, encoding:0x80000632, error: nil)
        println(str)
        
        var myArray = str.componentsSeparatedByString("|")
        
        appDelegate.aUrl = myArray
        
        let myStoryBoard = self.storyboard
        let anotherView:CollectionViewController = myStoryBoard?.instantiateViewControllerWithIdentifier("collectionID") as CollectionViewController
        self.presentViewController(anotherView, animated: true, completion: nil)
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