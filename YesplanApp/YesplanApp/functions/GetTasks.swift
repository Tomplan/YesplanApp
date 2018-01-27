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
    
    let tasks_json = "https://dewerft.yesplan.be/api/tasks/task%3Ateam%3A1203%20-%20task%3Astatus%3Adone?api_key=6AED6266671C92209161289C37D109E0"
    if let tasksDownload = Tasks(url: tasks_json) {
        //            tasksDownload.printTasks()
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
            
//            YPgroupedTasks.append(TasksSection(date: key, YPtasks: value))
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