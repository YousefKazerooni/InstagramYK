//
//  FeedViewController.swift
//  InstagramYK
//
//  Created by Yousef Kazerooni on 3/4/16.
//  Copyright © 2016 YousefKazerooni. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    
    @IBOutlet weak var tableView: UITableView!
    var photos: [PFObject]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                // do something with the data fetched
                print("data fetched")
                self.photos = posts
                self.tableView.reloadData()
            } else {
                // handle error
                print ("Error")
            }
        }
        
        

        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return photos?.count ?? 0
        
    }
    
    
    
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //created a cell that represent the TableView Cell which contains Caption and Image
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedTableViewCell", forIndexPath: indexPath) as! FeedTableViewCell
        
        //I am getting back an array from the Parse
        //So here I just go to one element of that array
        let photo = photos[indexPath.row]
        
        
        
        //Out of that array I extract "image" and "caption"
        //1- setting the image
        var instagramPost: PFObject! {
            didSet {
                print("did set the image")
                cell.photoFromParse.file = photo["media"] as? PFFile
                cell.photoFromParse.loadInBackground()
            }
        }
        
        
        
        //2-setting the caption
        let caption = photo ["caption"] as! String
        cell.captionUILabel.text = caption
        
        
        
        return cell

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
