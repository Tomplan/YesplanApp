//
//  VCTasks.swift
//  YesplanApp
//
//  Created by Tom Slegers on 22/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import UIKit

class VCTasks: UIViewController {
    
    var TVTasks: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tasks"
        self.view.backgroundColor = UIColor.lightGray
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        GetTasks()
    }
    
    
    func initializeInterfaceElements() {
        self.TVTasks.translatesAutoresizingMaskIntoConstraints = false
        self.TVTasks.dataSource = self
        self.TVTasks.delegate = self
        self.view.addSubview(self.TVTasks)
    }
    
    
    func autolayoutInterfaceElements() {
        self.TVTasks.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.TVTasks.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.TVTasks.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.TVTasks.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "DVCTask" {
//            print("ok1")
//
//            let detailVC: DVCTask? = segue.destination as? DVCTask
//            let cell: UITableViewCell? = sender as? TVCTasks
//
//            if let indexPath = TVTasks.indexPathForSelectedRow {
//                print("ok2")
//
//                let url = YPgroupedTasksSorted[indexPath.section].YPtasks[indexPath.row].url!
//                if let object = Task_Id(url: url) {
//                print("ok3")
//                //                let controller = (segue.destination as! UINavigationController).topViewController as! TasksDetailViewController
//
//
//                if cell != nil && detailVC != nil {
//                    detailVC!.TaskUrlText = object.url
//                    detailVC!.TaskIdText = object.id
//                    detailVC!.TaskOwnerText = object.owner?.name
//                    detailVC!.TaskOwningteamText = object.owningteam?.name
//                    detailVC!.TaskOwninggroupText = object.owninggroup?.name
//                    detailVC!.TaskStatusText = object.status
//                    detailVC!.TaskNameText = object.name
//                    detailVC!.TaskTeamText = object.team
////                    detailVC!.TaskCostText = object.cost
//                    detailVC!.TaskDueText = object.due
//                    detailVC!.TaskStartText = object.start
//                    detailVC!.TaskDescriptionText = object.description
//                    detailVC!.TaskAssignedbyText = object.assignedby
//                    detailVC!.TaskAssignedtoText = object.assignedto
//                    detailVC!.TaskDurationText = object.duration
//
//                    //                dump(detailVC!)
//                    }
//                }
//            }
//        }
//    }
    

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
        if let due = currentTask.due { cell!.LabelTasksDue.text = stringToDate(myDateString: due) }
        if let start = currentTask.start { cell!.LabelTasksStart.text = stringToDate(myDateString: start) }
        
        
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
    
    
}

extension VCTasks: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ok")
        let cell: UITableViewCell? = tableView.cellForRow(at: indexPath)
        
        if cell != nil {
            let detailVC: DVCTask = DVCTask()
            detailVC.contentText = cell?.textLabel?.text
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
