//
//  GetEventSchedules.swift
//  YesplanApp
//
//  Created by Tom Slegers on 18/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation


var scheduleList = [String]()
var eventName = String()

func GetSchedule(objectID: String) {
    
    scheduleList = []
//    let schedule = Schedule(url: "\(GlobalVariable.OrganizationURL)/api/event/\(objectID)/schedule?api_key=\(GlobalVariable.API_Key)")
//    print(GlobalVariable.URL)
    let schedule = Schedule(url: "\(GlobalVariable.URL)/schedule?api_key=\(GlobalVariable.API_Key)")

    if schedule != nil {
        for i in 0 ..< schedule!.entries.count {
            let MYschedule = "\(stringToTime(myDateString: schedule!.entries[i].starttime)) \(schedule!.entries[i].description)"
            scheduleList.append(MYschedule)
        }
    }
//    dump(scheduleList)
}
