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
        self.TVTasks.dataSource = self
        
        GetTasks()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCTasks") as! TVCTasks
         if YPgroupedTasksSorted[indexPath.section].YPtasks[indexPath.row].name != nil {
            cell.LabelTaskName.textColor = UIColor.red
        cell.LabelTaskName.text = YPgroupedTasksSorted[indexPath.section].YPtasks[indexPath.row].name!
        }
        if YPgroupedTasksSorted[indexPath.section].YPtasks[indexPath.row].due != nil {
            if YPgroupedTasksSorted[indexPath.section].YPtasks[indexPath.row].due != nil {
                cell.LabelTaskDue.textColor = UIColor.darkGray
                cell.LabelTaskDue.text = stringToDate(myDateString: YPgroupedTasksSorted[indexPath.section].YPtasks[indexPath.row].due!)
            } else {
                cell.LabelTaskDue.text = "geen vervaldatum"
            }
        } else
        {
            cell.LabelTaskDue.text = "geen vervaldatum"
        }

        if YPgroupedTasksSorted[indexPath.section].YPtasks[indexPath.row].assignedto != nil {
            cell.LabelTaskAssignedto.text = YPgroupedTasksSorted[indexPath.section].YPtasks[indexPath.row].assignedto!
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

