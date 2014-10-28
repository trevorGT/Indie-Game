//
//  CollectionViewController.swift
//  SorryMito
//
//  Created by 蒋国太 on 14/10/25.
//  Copyright (c) 2014年 trevor. All rights reserved.
//

import Foundation
class CollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    @IBOutlet var collectionView: UICollectionView?
    var items: [String]?
    var aData: [NSData]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Load
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        items = appDelegate.aUrl
        
        //NSLog(items?)
        // Init
       
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CustomColletionViewCell.self, forCellWithReuseIdentifier: "CustomColletionViewCell")
        //collectionView!.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(collectionView!)
        
        
        //let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items!.count-1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomColletionViewCell", forIndexPath: indexPath) as CustomColletionViewCell
        
        if let hostView = self.collectionView {
            
            dispatch_async(dispatch_get_main_queue()) {
                var img = NSURL(string: self.items![indexPath.row])
                let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
                
                var data:NSData = NSData.dataWithContentsOfURL(img, options: NSDataReadingOptions.UncachedRead, error: nil)
                println(indexPath.row)
                var imageBig = UIImage(data: data)
                cell.tag = indexPath.row
                cell.loadItem(self.items![indexPath.row])
                cell.imageView?.image = imageBig
                cell.imageView.clipsToBounds = true
                cell.imageView.contentMode = UIViewContentMode.ScaleAspectFit
                //cell.imageView.backgroundColor = UIColor.greenColor()
                //cell.imageView.contentMode = UIViewContentMode.Center
            }
        } else {
            // handle nil hostView
        }
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){

        var cell = collectionView.cellForItemAtIndexPath(indexPath) as CustomColletionViewCell
        
        let myStoryBoard = self.storyboard
        let anotherView:LargeViewController = myStoryBoard?.instantiateViewControllerWithIdentifier("largeID") as LargeViewController
        anotherView.strUrl = cell.strUrl
        self.presentViewController(anotherView, animated: true, completion: nil)
        
       // return cell
        
    }

    
    @IBAction func buttonAction(sender:UIButton)
    {
        let myStoryBoard = self.storyboard
        let anotherView:TagViewController = myStoryBoard?.instantiateViewControllerWithIdentifier("tagID") as TagViewController
        self.presentViewController(anotherView, animated: true, completion: nil)
    }
    
    @IBAction func backAction(sender:UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}