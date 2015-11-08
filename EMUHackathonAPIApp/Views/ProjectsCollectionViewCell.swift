//
//  ProjectsCollectionViewCell.swift
//  EMUHackathonAPIApp
//
//  Created by Laurent Shala on 11/8/15.
//  Copyright © 2015 Hackathon Group 4. All rights reserved.
//

import UIKit

class ProjectsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var projectImageView: UIImageView!
    @IBOutlet var projectTitleLable: UILabel!
    
    
    var project: Project?{
        
        didSet{
            projectTitleLable.text = project?.title
            project?.coverImage?.getDataInBackgroundWithBlock({ (data: NSData?, error: NSError?) -> Void in
                if data != nil {
                    self.projectImageView.image = UIImage(data: data!)
                }
            })
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        projectTitleLable.text = nil
        projectImageView.image = UIImage(named: "emuLogo")
    }

}
