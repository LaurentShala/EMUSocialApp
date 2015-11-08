//
//  ProjectsViewController.swift
//  EMUHackathonAPIApp
//
//  Created by Laurent Shala on 11/8/15.
//  Copyright © 2015 Hackathon Group 4. All rights reserved.
//

import UIKit
import Parse

class ProjectsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var filterSegmentedControl: UISegmentedControl!
    
    @IBAction func filterSegmentedControlChanged(sender: UISegmentedControl) {
//        switch (filterSegmentedControl.selectedSegmentIndex){
//        case 0: break
//        case 1:
//            
//            let query = PFQuery(className:"Difficulty")
//        query.getObjectInBackgroundWithId("byiyz5a8nm") {
//            (difficulty: PFObject?, error: NSError?) -> Void in
//            if error == nil && difficulty != nil {
//                let query = PFQuery(className: "Project")
//                query.whereKey("difficulty", equalTo: difficulty!)
//                query.findObjectsInBackgroundWithBlock {
//                    (searchResults: [PFObject]?, error: NSError?) -> Void in
//                    var projectArray: [Project] =  [searchResults] as! NSArray
//                }
//                
//            }else {
//                print(error)
//            }
//        }
//            
//             break
//        case 2: break
//        case 3: break
//        default: break
//        }
        
    }

    
    var projects: [Project]?
    let showDetailSegueIdentifier = "ProjectsViewControllerShowDetailsSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillEnterForeground:", name: UIApplicationWillEnterForegroundNotification, object: nil)
        refreshProjects()
    }
    
    func refreshProjects(){
        Project.findAllProjectsWithBlock { (projects, error) -> Void in
            self.projects = projects
            self.collectionView.reloadData()
        }
    }
    
    func applicationWillEnterForeground(notification: NSNotification!){
        refreshProjects()
        NSLog("App did enter foreground!")
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItems = 0
        if let numberOfProjects = projects?.count{
            numberOfItems = numberOfProjects
        }
        
        return numberOfItems
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProjectsCollectionViewCell", forIndexPath: indexPath) as! ProjectsCollectionViewCell
        cell.project = projectAt(indexPath)
        return cell
    }
    
    func projectAt(indexPath: NSIndexPath) -> Project!{
        return projects?[indexPath.row]
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(showDetailSegueIdentifier, sender: indexPath)
    }
    
    // MARK: Other
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == showDetailSegueIdentifier{
            let detailsViewController = segue.destinationViewController as! ProjectDetailsViewController
            detailsViewController.project = projectAt(sender as! NSIndexPath)
        }
    }
    
    
}
