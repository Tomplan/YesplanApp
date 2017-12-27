//
//  GetEvents.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

var groupedEvents = [String : [Event]]()
var profileColorArray: [String] = []
var YPEventProfileColor = ""

public func GetEvents()
{
    print(selectedDateString)
    if selectedDateString.isEmpty == true {
        GetCurrentDate()
    }
            YPgroupedEvents.removeAll()
            YPgroupedEventsSorted.removeAll()
    //
    print("*: ",selectedDateString)
    print("*: ",selectedEndDateString)
    let events = Events.from(url: "https://dewerft.yesplan.be/api/events/event%3Adate%3A\(selectedDateString)%20TO%20\(selectedEndDateString)%20event%3Astatus%3Abevestigd?api_key=6AED6266671C92209161289C37D109E0")!
    //            dump(events)
//        ************** compress by date ************
    
        groupedEvents = Dictionary(grouping: events.data, by: { $0.startdate! })
    
//      ****************************************************
    
    
    for (key, value) in groupedEvents {
        for i in 0 ..< value.count {
            if value[i].defaultschedulestarttime != nil {
            } else {
                value[i].defaultschedulestarttime = "no starttime"
            }
        }
        for (_, value) in groupedEvents {
            for i in 0 ..< value.count {
                if value[i].defaultscheduleendtime != nil {
                } else {
                    value[i].defaultscheduleendtime = "no endtime"
                }
            }
        }
        
        let valueSorted = value.sorted{ $0.defaultschedulestarttime! <  $1.defaultschedulestarttime! }
        YPgroupedEvents.append(EventsSection(date: key, YPEvents: valueSorted))
        
    }
    YPgroupedEventsSorted = YPgroupedEvents.sorted(by: { $0.date < $1.date } )

    
    //        let contactbookings = Contactbookings.from(url: "https://dewerft.yesplan.be/api/contactbookings?api_key=6AED6266671C92209161289C37D109E0")
    //        dump(contactbookings)
    //        let contacts = Contacts.from(url: "https://dewerft.yesplan.be/api/contacts?api_key=6AED6266671C92209161289C37D109E0")!
    //           dump(contacts)
    //        let tasks = Tasks.from(url: "https://dewerft.yesplan.be/api/tasks/task%3Ateam%3A1203%20-%20task%3Astatus%3Adone?api_key=6AED6266671C92209161289C37D109E0")
    //        dump(tasks)
    //        let profiles = Profiles.from(url: "https://dewerft.yesplan.be/api/profiles?api_key=6AED6266671C92209161289C37D109E0")!
    //                   dump(profiles)
    //        let myStatuses = YPData.from(url: "https://dewerft.yesplan.be/api/statuses?api_key=6AED6266671C92209161289C37D109E0")
    //        dump(myStatuses)
    
}
