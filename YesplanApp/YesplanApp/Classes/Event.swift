//
//  Event.swift
//  YesplanApp
//
//  Created by Tom Slegers on 10/12/17.
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
    let enddate: String?
    let endtime: String?
    let group: Group?
    let id: String?
    let isproduction: Bool?
    let labels: [JSONAny]?
    let locations: [Group]?
    let name: String?
    let owner: Group?
    let owninggroup: Group?
    let owningteam: Group?
    let production: JSONNull?
    let profile: Group?
    let startdate: String?
    let starttime: String?
    let status: Group?
    let type: String?
    let url: String?
    let defaultstartidx: Int?
    let defaultstopidx: Int?
    let entries: [Group]?
    let event: Event?
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
        case startdate = "startdate"
        case starttime = "starttime"
        case status = "status"
        case type = "_type"
        case url = "url"
        case defaultstartidx = "defaultstartidx"
        case defaultstopidx = "defaultstopidx"
        case entries = "entries"
        case event = "event"
    }
}


