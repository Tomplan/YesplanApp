//
//  TVCTasks.swift
//  YesplanApp
//
//  Created by Tom Slegers on 23/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import UIKit

class TVCTasks: UITableViewCell {

    @IBOutlet weak var ViewBorder: UIView!
    @IBOutlet weak var LabelTaskName: UILabel!
    
    @IBOutlet weak var LabelTaskDue: UILabel!
    
    @IBOutlet weak var LabelTaskAssignedto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
