//
//  DVCTask.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 26/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import UIKit

class DVCTask: UIViewController {

    var TaskAssignedbyText: String?
    var TaskAssignedtoText: String?
    var TaskCostText: Int?
    var TaskDescriptionText: String?
    var TaskDueText: String?
    var TaskDurationText: String?
    var TaskEventText: String?
    var TaskIdText: String?
    var TaskNameText: String?
    var TaskOwnerText: String?
    var TaskOwninggroupText: String?
    var TaskOwningteamText: String?
    var TaskStartText: String?
    var TaskStatusText: String?
    var TaskTeamText: String?
    var TaskUrlText: String?
    
    @IBOutlet weak var LabelTaskUrl: UILabel!
    @IBOutlet weak var LabelTaskId: UILabel!
    @IBOutlet weak var LabelTaskOwner: UILabel!
    @IBOutlet weak var LabelTaskOwningteam: UILabel!
    @IBOutlet weak var LabelTaskOwninggroup: UILabel!
    @IBOutlet weak var LabelTaskStatus: UILabel!
    @IBOutlet weak var LabelTaskName: UILabel!
    @IBOutlet weak var LabelTaskTeam: UILabel!
    @IBOutlet weak var LabelTaskCost: UILabel!
    @IBOutlet weak var LabelTaskDue: UILabel!
    @IBOutlet weak var LabelTaskStart: UILabel!
    @IBOutlet weak var LabelTaskDescription: UILabel!
    @IBOutlet weak var LabelTaskAssignedby: UILabel!
    @IBOutlet weak var LabelTaskAssignedto: UILabel!
    @IBOutlet weak var LabelTaskDuration: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if TaskUrlText != nil { self.LabelTaskUrl.text = TaskUrlText! }
        
        if TaskIdText != nil { self.LabelTaskId.text = TaskIdText! }
        
        if TaskOwnerText != nil { self.LabelTaskOwner.text = TaskOwnerText! }
        
        if TaskOwningteamText != nil { self.LabelTaskOwningteam.text = TaskOwningteamText! }
        
        if TaskOwninggroupText != nil { self.LabelTaskOwninggroup.text = TaskOwninggroupText! }
        
        if TaskStatusText != nil { self.LabelTaskStatus.text = TaskStatusText! }
        
        if TaskNameText != nil { self.LabelTaskName.text = TaskNameText! }
        
        if TaskTeamText != nil { self.LabelTaskTeam.text = TaskTeamText! }
        
//        if TaskCostText != nil { self.LabelTaskCost.text = TaskCostText! }
        
        if TaskStartText != nil { self.LabelTaskStart.text = TaskStartText! }
        
        if TaskDescriptionText != nil { self.LabelTaskDescription.text = TaskDescriptionText! }

        if TaskAssignedbyText != nil { self.LabelTaskAssignedby.text = TaskAssignedbyText! }
        
        if TaskAssignedbyText != nil { self.LabelTaskAssignedby.text = TaskAssignedbyText! }
        
        if TaskDurationText != nil { self.LabelTaskDuration.text = TaskDurationText! }

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
