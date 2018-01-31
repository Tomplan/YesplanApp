//
//  TasksSection.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 24/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation


struct TasksSection: Codable{
    let date:String
    var YPtasks:[Task_Id]
}

var YPgroupedTasks = [TasksSection]()
var YPgroupedTasksSorted = [TasksSection]()

