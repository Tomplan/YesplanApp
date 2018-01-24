//
//  VCTasks.swift
//  YesplanApp
//
//  Created by Tom Slegers on 22/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import UIKit

class VCTasks: UIViewController {

    var tasksSorted = [Task_Id]()
    var dueTasks = [Task_Id]()
    
    @IBOutlet weak var TVTasks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TVTasks.dataSource = self
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 140
        
        GetTasks()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func GetTasks() {
        let tasks_json = "https://dewerft.yesplan.be/api/tasks/task%3Ateam%3A1203%20-%20task%3Astatus%3Adone?api_key=6AED6266671C92209161289C37D109E0"
        if let tasksDownload = Tasks(url: tasks_json) {
//            tasksDownload.printTasks()
            let tasks = tasksDownload.data
            
            for task in tasks where task.due == nil {
                    tasksSorted.append(task)
            }
            
            for task in tasks where task.due != nil {
                dueTasks.append(task) }
            
            dueTasks = dueTasks.sorted {
                $0.due!.localizedCaseInsensitiveCompare($1.due!) == ComparisonResult.orderedAscending
            }

            for task in dueTasks {
                tasksSorted.append(task)
            }
        } else { print("not ok") }
    }
}



extension VCTasks: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(tasksSorted.count)
        return tasksSorted.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCTasks") as! TVCTasks
         if tasksSorted[indexPath.row].name != nil {
            cell.LabelTaskName.textColor = UIColor.red
        cell.LabelTaskName.text = tasksSorted[indexPath.row].name!
        }
        if tasksSorted[indexPath.row].due != nil {
            if tasksSorted[indexPath.row].due != nil {
                cell.LabelTaskDue.textColor = UIColor.darkGray
                cell.LabelTaskDue.text = stringToDate(myDateString: tasksSorted[indexPath.row].due!)
            } else {
                cell.LabelTaskDue.text = "geen vervaldatum"
            }
        } else
        {
            cell.LabelTaskDue.text = "geen vervaldatum"
        }

        if tasksSorted[indexPath.row].assignedto != nil {
            cell.LabelTaskAssignedto.text = tasksSorted[indexPath.row].assignedto!
        } else {
            cell.LabelTaskAssignedto.text = "niet toegewezen"
        }
        cell.ViewBorder.layer.cornerRadius = 5
        cell.ViewBorder.layer.borderWidth = 4
        cell.ViewBorder.layer.shadowOffset = CGSize(width: -1, height: 1)
//        cell.backgroundColor = UIColor.darkGray
        
        let backgroundcolor = UIColor(red: 255/255, green: 250/255, blue: 205/255, alpha: 1)
        cell.ViewBorder.backgroundColor = backgroundcolor
            
//        cell.ViewBorder.backgroundColor = UIColor.gray
        return cell
    }
}

