//
//  GetEventSchedules.swift
//  YesplanApp
//
//  Created by Tom Slegers on 18/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation


var ScheduleList = [String]()


func GetSchedule(objectID: String) {
    let schedule = Schedule.from(url: "https://dewerft.yesplan.be/api/event/\(objectID)/schedule?api_key=6AED6266671C92209161289C37D109E0")
    if schedule != nil {
        for i in 0 ..< schedule!.entries.count {
            let MYschedule = "\(stringToTime(myDateString: schedule!.entries[i].starttime)) \(schedule!.entries[i].description)"
            ScheduleList.append(MYschedule)
        }
    }
//    dump(ScheduleList)
}
