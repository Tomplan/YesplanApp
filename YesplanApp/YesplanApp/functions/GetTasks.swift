//
//  GetTasks.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 24/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

var groupedTasks = [String : [Task_Id]]()
var tasksSorted = [Task_Id]()
var dueTasks = [Task_Id]()

public func GetTasks()

{
    YPgroupedTasks.removeAll()
    YPgroupedTasksSorted.removeAll()
    
    let tasks_json = "\(GlobalVariable.OrganizationURL)/api/tasks/task%3A\(GlobalVariable.TeamId)%20-%20task%3Astatus%3Adone?api_key=\(GlobalVariable.API_Key)"
    if let tasksDownload = Tasks(url: tasks_json) {
        let tasks = tasksDownload.data
        
        //        First: group all tasks where due = nil
        
        for task in tasks where task.due == nil {
            tasksSorted.append(task)
        }
        
        groupedTasks["geen vervaldatum"] = tasksSorted
        
        for (key, value) in groupedTasks {
            
            YPgroupedTasks.append(TasksSection(date: key, YPtasks: value))
            
        }
        
        //   Second: group all tasks where due != nil
        
        for task in tasks where task.due != nil {
            dueTasks.append(task)
            
        }
        
//        dueTasks = dueTasks.sorted {
//            $0.due!.localizedCaseInsensitiveCompare($1.due!) == ComparisonResult.orderedAscending
//        }
        
        
//        for task in dueTasks {
//            tasksSorted.append(task)
//        }
        
        groupedTasks = Dictionary(grouping: dueTasks, by: { stringToDateShort(myDateString: $0.due!)})
//        print(groupedTasks)
        
        for (key, value) in groupedTasks {

            YPgroupedTasks.append(TasksSection(date: key, YPtasks: value.sorted(by: { $0.due! < $1.due! } )))

        }
        
        YPgroupedTasksSorted = YPgroupedTasks.sorted(by: { $0.date < $1.date } )
//                print(YPgroupedTasksSorted)


    } else { print("not ok") }
    
    
}
