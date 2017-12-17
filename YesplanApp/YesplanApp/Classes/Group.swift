//
//  Groups.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation
// To parse the JSON, add this file to your project and do:
//
//   let group = Group.from(json: jsonString)!

import Foundation

class Group: Codable {
    let attributes: Attributes?
    let children: [Child]?
    let enddate: String?
    let endtime: String?
    let group: JSONNull?
    let id: String?
    let isproduction: Bool?
    let locations: [Location]?
    let name: String?
    let owner: Own?
    let owninggroup: Own?
    let owningteam: Own?
    let production: JSONNull?
    let profile: Profile?
    let profiles: [Profile]
    let startdate: String?
    let starttime: String?
    let status: Status?
    let statuses: [Status]?
    let type: String?
    let url: String?
}

extension Group {
    enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
        case children = "children"
        case enddate = "enddate"
        case endtime = "endtime"
        case group = "group"
        case id = "id"
        case isproduction = "isproduction"
        case locations = "locations"
        case name = "name"
        case owner = "owner"
        case owninggroup = "owninggroup"
        case owningteam = "owningteam"
        case production = "production"
        case profile = "profile"
        case profiles = "profiles"
        case startdate = "startdate"
        case starttime = "starttime"
        case status = "status"
        case statuses = "statuses"
        case type = "_type"
        case url = "url"
    }
}
