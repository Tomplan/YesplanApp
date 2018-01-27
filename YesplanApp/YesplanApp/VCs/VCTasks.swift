//
//  VCTasks.swift
//  YesplanApp
//
//  Created by Tom Slegers on 22/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import UIKit

// tasksSorted = [Task_Id]()

class VCTasks: UIViewController {

    @IBOutlet weak var TVTasks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.TVTasks.dataSource = self
        
        GetTasks()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DVCTask" {
            let detailVC: DVCTask? = segue.destination as? DVCTask
            let cell: UITableViewCell? = sender as? TVCTasks
            
            if let indexPath = TVTasks.indexPathForSelectedRow {
                let url = YPgroupedTasksSorted[indexPath.section].YPtasks[indexPath.row].url!
                if let object = Task_Id(url: url) {
                
                //                let controller = (segue.destination as! UINavigationController).topViewController as! TasksDetailViewController
                
                
                if cell != nil && detailVC != nil {
                    detailVC!.TaskUrlText = object.url
                    detailVC!.TaskIdText = object.id
                    detailVC!.TaskOwnerText = object.owner?.name
                    detailVC!.TaskOwningteamText = object.owningteam?.name
                    detailVC!.TaskOwninggroupText = object.owninggroup?.name
                    detailVC!.TaskStatusText = object.status
                    detailVC!.TaskNameText = object.name
                    detailVC!.TaskTeamText = object.team
//                    detailVC!.TaskCostText = object.cost
                    detailVC!.TaskDueText = object.due
                    detailVC!.TaskStartText = object.start
                    detailVC!.TaskDescriptionText = object.description
                    detailVC!.TaskAssignedbyText = object.assignedby
                    detailVC!.TaskAssignedtoText = object.assignedto
                    detailVC!.TaskDurationText = object.duration

                    //                dump(detailVC!)
                    }
                }
            }
        }
    }
    

}

extension VCTasks: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return YPgroupedTasksSorted.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionCell = ""
        if  YPgroupedTasksSorted[section].date != "geen vervaldatum" { sectionCell = stringToEventsDate(myDateString: YPgroupedTasksSorted[section].date)} else { sectionCell = "geen vervaldatum" }
        
        return  sectionCell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return YPgroupedTasksSorted[section].YPtasks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: TVCTasks? = tableView.dequeueReusableCell(withIdentifier: "TVCTasks") as? TVCTasks
        
        
        if cell == nil {
            cell = TVCTasks(style: .default, reuseIdentifier: "TVCTasks")
        }
        
        let currentTask = YPgroupedTasksSorted[indexPath.section].YPtasks[indexPath.row]
                
        if let name = currentTask.name { cell!.LabelTasksName.text = name }
        if let due = currentTask.due { cell!.LabelTasksDue.text = due }
        if let start = currentTask.start { cell!.LabelTasksStart.text = start }
        
        
        return cell!
    }
    
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60.0
//    }
    
//    class CustomCell: UITableViewCell {
//        var cellButton: UIButton!
//        var cellLabel: UILabel!
//
//        init(frame: CGRect, title: String) {
//            super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
//
//            cellLabel= UILabel(frame: CGRectMake(self.frame.width - 100, 10, 100.0, 40))
//            cellLabel.textColor = UIColor.blackColor()
//            cellLabel.font = //set font here
//
//                cellButton = UIButton(frame: CGRectMake(5, 5, 50, 30))
//            cellButton.setTitle(title, forState: UIControlState.Normal)
//
//            addSubview(cellLabel)
//            addSubview(cellButton)
//        }
//
//        required init?(coder aDecoder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//
//        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//            super.init(style: style, reuseIdentifier: reuseIdentifier)
//        }
//    }
    
        
//        let row = YPgroupedTasksSorted[indexPath.section].YPtasks[indexPath.row]
//         if row.name != nil {
//            cell.LabelTaskName.textColor = UIColor.red
//        cell.LabelTaskName.text = row.name!
//        }
//        if row.due != nil {
//            if row.due != nil {
//                cell.LabelTaskDue.textColor = UIColor.darkGray
//                cell.LabelTaskDue.text = ("deadline: \(stringToTime(myDateString: row.due!))")
//            } else {
//                cell.LabelTaskDue.text = "geen vervaldatum"
//            }
//        } else
//        {
//            cell.LabelTaskDue.text = "geen vervaldatum"
//        }
//
//        if row.assignedto != nil {
//            cell.LabelTaskAssignedto.text = row.assignedto!
//        } else {
//            cell.LabelTaskAssignedto.text = "niet toegewezen"
//        }
//        cell.ViewBorder.layer.cornerRadius = 5
//        cell.ViewBorder.layer.borderWidth = 4
//        cell.ViewBorder.layer.shadowOffset = CGSize(width: -1, height: 1)
////        cell.backgroundColor = UIColor.darkGray
//
//        let backgroundcolor = UIColor(red: 255/255, green: 250/255, blue: 205/255, alpha: 1)
//        cell.ViewBorder.backgroundColor = backgroundcolor
//
//        TVTasks.backgroundColor = UIColor.lightGray
////        cell.backgroundColor = UIColor.blue // not this one
//
////        cell.ViewBorder.backgroundColor = UIColor.gray
//        return cell
//    }
}

