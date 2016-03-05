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
    
    
    @IBOutlet weak var displayedImageView: UIImageView!
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
           displayedImageView.image = editedImage
           
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
            
    }
    
    
  
    @IBAction func onSubmit(sender: AnyObject) {
        
        //Resizing the image, to conform to parse's requirements
        let newImage = resize(displayedImageView.image!, newSize: CGSize(width: 300, height: 500))
    
        Post.postUserImage(newImage, withCaption: captionTextField.text!) { (success: Bool, erro: NSError?) -> Void in
//            code
            if success{
                print("Posted")
                self.displayedImageView.image = nil
                self.captionTextField.text = nil
                
            } else {
                print("not posted")
                
            }
        }
        
    }
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage {
        let resizeImageView = UIImageView(frame: CGRectMake(0, 0, newSize.width, newSize.height))
        resizeImageView.contentMode = UIViewContentMode.ScaleAspectFill
        resizeImageView.image = image
        
        UIGraphicsBeginImageContext(resizeImageView.frame.size)
        resizeImageView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
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
