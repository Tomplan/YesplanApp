//
//  TVCEvents.swift
//  YesplanApp
//
//  Created by Tom Slegers on 9/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import UIKit

class TVCEvents: UITableViewCell {

    @IBOutlet weak var ViewBorder: UIView!
    @IBOutlet weak var LblEventsDefaultschedulestarttime: UILabel!
    @IBOutlet weak var LblEventLocation: UILabel!
    @IBOutlet weak var LblEventName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
