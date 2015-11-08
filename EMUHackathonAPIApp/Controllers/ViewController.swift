//
//  ViewController.swift
//  EMUHackathonAPIApp
//
//  Created by Laurent Shala on 11/7/15.
//  Copyright © 2015 Hackathon Group 4. All rights reserved.
//

import UIKit
import Parse
import CRToast


class ViewController: UIViewController {

    @IBOutlet var enterEmail: UITextField!
    @IBOutlet var enterPassword: UITextField!
    
    @IBAction func loginButtonAction(sender: AnyObject) {
        Login()
    }
    
    func Login(){
        let user = PFUser()
        user.email = enterEmail.text
        user.username = user.email
        user.password = enterPassword.text
        
        PFUser.logInWithUsernameInBackground(enterEmail.text!, password: enterPassword.text!, block: {
            (user: PFUser?, Error: NSError?) -> Void in
            if Error == nil{
                NSLog("about to show mainVC")
                self.performSegueWithIdentifier("LoginViewControllerShowMainSegue", sender: self)

            }
            else{
                
                CRToastManager.showNotificationWithMessage("Error Login", completionBlock: nil)
                
                
            }
        })
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func didTapBG(sender: UITapGestureRecognizer) {
        enterEmail.resignFirstResponder()
        enterPassword.resignFirstResponder()
    }
    
        
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
