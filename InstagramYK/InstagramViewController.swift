//
//  InstagramViewController.swift
//  InstagramYK
//
//  Created by Yousef Kazerooni on 3/1/16.
//  Copyright © 2016 YousefKazerooni. All rights reserved.
//

import UIKit
import Parse
class InstagramViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageDisplayedView: UIView!
    @IBOutlet weak var captionTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onLogOut(sender: AnyObject) {
        PFUser.logOut()
        //AppDelegate.onLogOut
       
    }

//    @IBAction func onTakePicture(sender: AnyObject) {
//        
//        let vc = UIImagePickerController()
//        vc.delegate = self
//        vc.allowsEditing = true
//        vc.sourceType = UIImagePickerControllerSourceType.Camera
//        
//        self.presentViewController(vc, animated: true, completion: nil)
//        
//    }
    
    
    
    @IBAction func onChoosing(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
   
    
    
  
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            // Do something with the images (based on your use case)
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
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
