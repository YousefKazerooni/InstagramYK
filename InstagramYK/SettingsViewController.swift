//
//  SettingsViewController.swift
//  InstagramYK
//
//  Created by Yousef Kazerooni on 3/4/16.
//  Copyright © 2016 YousefKazerooni. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOut()
        // PFUser.currentUser() will now be nil
        
        //in order to access the logout function inside AppDelegate you must first
        //access the current instance of it
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.onlogOut()
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
