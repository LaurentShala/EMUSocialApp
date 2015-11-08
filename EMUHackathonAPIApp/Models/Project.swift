//
//  Project.swift
//  EMUHackathonAPIApp
//
//  Created by Laurent Shala on 11/8/15.
//  Copyright © 2015 Hackathon Group 4. All rights reserved.
//

import Foundation
import Parse
public typealias ProjectFetchResultsBlock = (projects: [Project]?, error: NSError?) -> Void

public class Project: PFObject, PFSubclassing{

    public class func parseClassName() -> String {
        return "Project"
    }
    
    
    @NSManaged public var owner: PFUser?
    @NSManaged public var coverImage: PFFile?
    @NSManaged public var title: String?
    @NSManaged public var info: String?
    @NSManaged public var difficulty: Difficulty?
    
    
    
    public class func findAllProjectsWithBlock(block: ProjectFetchResultsBlock?){
        let query = self.query()!
        query.orderByDescending("createdAt")
        query.includeKey("owner")
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error:  NSError?) -> Void in
            if block != nil{
                block!(projects: objects as? [Project], error: error)
            }
        }
    }
}
