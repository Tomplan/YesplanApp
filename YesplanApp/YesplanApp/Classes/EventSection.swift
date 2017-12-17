//
//  EventSection.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

struct EventsSection: Codable{
    let date:String
    var YPEvents:[Event]
}

var YPgroupedEvents = [EventsSection]()
var YPgroupedEventsSorted = [EventsSection]()
