//
//  Event.swift
//  YesplanApp
//
//  Created by Tom Slegers on 10/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Event: Codable {
    let address: String?
    let addresses: [Event]?
    let addresslines: String?
    let addresstype: String?
    let assignedby: String?
    let assignedto: String?
    let attributes: Event?
    let city: String?
    let comment: String?
    let contactinfo: [Event]?
    let cost: Int?
    let country: String?
    let countrycode: String?
    let defaultscheduledescription: String?
    let defaultscheduleend: String?
    var defaultscheduleendtime: String?
    let defaultschedulestart: String?
    var defaultschedulestarttime: String?
    let defaultstartidx: Int?
    let defaultstopidx: Int?
    let description: String?
    let department: String?
    let due: String?
    let duration: String?
    let enddate: String?
    let endtime: String?
    let entries: [Event]?
    let event: Event?
    let firstname: String?
    let group: Event?
    let id: String?
    let imageurl: JSONNull?
    let isproduction: Bool?
    let isdefault: Bool?
    let jobtitle: String?
    let labels: [JSONAny]?
    let languagecode: String?
    let lastname: String?
    let links: [Event]?
    let locations: [Event]?
    let name: String?
    let organization: Event?
    let owner: Event?
    let owninggroup: Event?
    let owningteam: Event?
    let person: Event?
    let production: JSONNull?
    let profile: Event?
    let start: String?
    let startdate: String?
    let starttime: String?
    let status: JSONAny?
    let street: [String]?
    let team: String?
    let title: String?
    let type: String?
    let url: String?
    let value: String?
    let zipcode: String?
    
}

extension Event {
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case addresses = "addresses"
        case addresslines = "addresslines"
        case addresstype = "addresstype"
        case assignedby = "assignedby"
        case assignedto = "assignedto"
        case attributes = "attributes"
        case city = "city"
        case comment = "comment"
        case contactinfo = "contactinfo"
        case cost = "cost"
        case country = "country"
        case countrycode = "countrycode"
        case defaultscheduledescription = "defaultscheduledescription"
        case defaultscheduleend = "defaultscheduleend"
        case defaultscheduleendtime = "defaultscheduleendtime"
        case defaultschedulestart = "defaultschedulestart"
        case defaultschedulestarttime = "defaultschedulestarttime"
        case defaultstartidx = "defaultstartidx"
        case defaultstopidx = "defaultstopidx"
        case description = "description"
        case department = "department"
        case due = "due"
        case duration = "duration"
        case enddate = "enddate"
        case endtime = "endtime"
        case entries = "entries"
        case event = "event"
        case firstname = "firstname"
        case group = "group"
        case id = "id"
        case imageurl = "imageurl"
        case isdefault = "isdefault"
        case isproduction = "isproduction"
        case jobtitle = "jobtitle"
        case labels = "labels"
        case languagecode = "languagecode"
        case lastname = "lastname"
        case links = "links"
        case locations = "locations"
        case name = "name"
        case organization = "organization"
        case owner = "owner"
        case owninggroup = "owninggroup"
        case owningteam = "owningteam"
        case person = "person"
        case production = "production"
        case profile = "profile"
        case start = "start"
        case startdate = "startdate"
        case starttime = "starttime"
        case status = "status"
        case street = "street"
        case team = "team"
        case title = "title"
        case type = "_type"
        case url = "url"
        case value = "value"
        case zipcode = "zipcode"
    }
}


