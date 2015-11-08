//
//  ProjectDetailsViewController.swift
//  EMUHackathonAPIApp
//
//  Created by Laurent Shala on 11/8/15.
//  Copyright © 2015 Hackathon Group 4. All rights reserved.
//

import UIKit
import MessageUI
import CRToast

class ProjectDetailsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet var infoTextView: UITextView!
    @IBOutlet var imageView: UIImageView!
    
    var project: Project?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = project?.title
        project?.coverImage?.getDataInBackgroundWithBlock({ (data: NSData?, error: NSError?) -> Void in
            if data != nil {
                self.imageView.image = UIImage(data: data!)
            }
        })
        self.infoTextView.text = project?.info
    }
    
    @IBAction func didTapContactButton(sender: UIBarButtonItem) {
        if MFMailComposeViewController.canSendMail(){
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.mailComposeDelegate = self
            mailComposeViewController.setSubject(project!.title!)
            mailComposeViewController.setToRecipients([project!.owner!.email!])
            presentViewController(mailComposeViewController, animated: true, completion: nil)
            
        }else {
            CRToastManager.showNotificationWithMessage("Email not set up!", completionBlock: nil)
        }
    }
    
    
    // MARK: MFMailComposeViewControllerDelegate
    
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
