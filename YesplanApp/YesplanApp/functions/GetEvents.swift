//
//  GetEvents.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

var groupedEvents = [String : [Event_Id]]()
var profileColorArray: [String] = []
var YPEventProfileColor = ""

public func GetEvents()
{
    if selectedDateString.isEmpty == true {
        GetCurrentDate()
    }
            YPgroupedEvents.removeAll()
            YPgroupedEventsSorted.removeAll()
    
    let events = Events(url: "\(GlobalVariable.OrganizationURL)/api/events/event%3Adate%3A\(selectedDateString)%20TO%20\(selectedEndDateString)%20event%3Astatus%3Abevestigd?api_key=\(GlobalVariable.API_Key)")!
//        ************** compress by date ************
    
        groupedEvents = Dictionary(grouping: events.data, by: { $0.startdate! })
    
//      ****************************************************
    
    
    for (key, value) in groupedEvents {
//        for i in 0 ..< value.count {
//            print("\(value[i].defaultschedulestarttime!), - \(value[i].defaultscheduleendtime!)")
//        }
        
        let valueSorted = value.sorted{ $0.defaultschedulestarttime ?? "no starttime" <  $1.defaultschedulestarttime ?? "no endtime" }
        YPgroupedEvents.append(EventsSection(date: key, YPEvents: valueSorted))
        
    }
    YPgroupedEventsSorted = YPgroupedEvents.sorted(by: { $0.date < $1.date } )

}
