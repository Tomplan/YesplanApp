//
//  Event.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Event: Codable {
    let attributes: Attributes?
    let defaultscheduledescription: String?
    let defaultscheduleend: String?
    var defaultscheduleendtime: String?
    let defaultschedulestart: String?
    var defaultschedulestarttime: String?
    let enddate: String?         //  Date on which the end of the event appears in the calendar.
    let endtime: String?         // Date and time of the end of the event.
    let group: Profile?
    let id: String
    let isproduction: Bool?
    let labels: [JSONAny]?
    let locations: [Profile]?
    let name: String?
    let owner: Own?
    let owninggroup: Own?
    let owningteam: Own?
    let production: JSONNull?
    let profile: Profile?
    let resource: Resource?
    let startdate: String?       // Date on which the start of the event appears in the calendar.
    let starttime: String?       // Date and time of the start of the event.
    let status: Status?
    let type: String
    let url: String
}

extension Event {
    enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
        case defaultscheduledescription = "defaultscheduledescription"
        case defaultscheduleend = "defaultscheduleend"
        case defaultscheduleendtime = "defaultscheduleendtime"
        case defaultschedulestart = "defaultschedulestart"
        case defaultschedulestarttime = "defaultschedulestarttime"
        case enddate = "enddate"
        case endtime = "endtime"
        case group = "group"
        case id = "id"
        case isproduction = "isproduction"
        case labels = "labels"
        case locations = "locations"
        case name = "name"
        case owner = "owner"
        case owninggroup = "owninggroup"
        case owningteam = "owningteam"
        case production = "production"
        case profile = "profile"
        case resource = "resource"
        case startdate = "startdate"
        case starttime = "starttime"
        case status = "status"
        case type = "_type"
        case url = "url"
    }
}




