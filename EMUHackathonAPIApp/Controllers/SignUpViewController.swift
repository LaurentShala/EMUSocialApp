//
//  SignUpViewController.swift
//  EMUHackathonAPIApp
//
//  Created by Laurent Shala on 11/7/15.
//  Copyright © 2015 Hackathon Group 4. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var repeatTextField: UITextField!
    
    @IBAction func signUpButtonAction(sender: AnyObject) {
        SignUp()
    }
    
    @IBAction func backToLoginButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func SignUp(){
        
        if passwordTextField.text == repeatTextField.text{
        
        let user = PFUser()
        user.email = emailTextField.text
        user.username = user.email
        user.password = passwordTextField.text
        
        
        
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if error == nil {
                NSLog("Hooray! Let them use the app now.")
            } else {
                NSLog("Error signing up: %@", error!)
            }
        }
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
