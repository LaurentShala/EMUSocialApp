//
//  Difficulty.swift
//  EMUHackathonAPIApp
//
//  Created by Laurent Shala on 11/8/15.
//  Copyright © 2015 Hackathon Group 4. All rights reserved.
//

import Foundation
import Parse

public class Difficulty: PFObject, PFSubclassing{
    
    public class func parseClassName() -> String {
        return "Difficulty"
    }
    
    @NSManaged public var name: String?
}