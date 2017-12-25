//
//  DVCEventTimeSchedules.swift
//  YesplanApp
//
//  Created by Tom Slegers on 18/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import UIKit

class DVCEventTimeSchedules: UIViewController {
    
    var ScheduleListText: String?
    
    @IBOutlet weak var LblSchedule: UILabel!
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
//        let tbvc = self.tabBarController  as! TBCEvent

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if ScheduleListText != nil {
            self.LblSchedule.text =
                ScheduleListText
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
