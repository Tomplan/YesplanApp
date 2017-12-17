//
//  ResourceBooking.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation
// To parse the JSON, add this file to your project and do:
//
//   let resourcebooking = Resourcebooking.from(json: jsonString)!

import Foundation

class Resourcebooking: Codable {
    let actualend: String?
    let actualnumber: Int?
    let actualstart: String?
    let end: String
    let event: Resourceinstance
    let id: String
    let number: Int
    let owner: Own
    let owninggroup: Own
    let owningteam: Own
    let resource: Resource
    let resourceinstance: Resourceinstance?
    let role: String?
    let start: String
    let type: String
    let url: String
}

extension Resourcebooking {
    enum CodingKeys: String, CodingKey {
        case actualend = "actualend"
        case actualnumber = "actualnumber"
        case actualstart = "actualstart"
        case end = "end"
        case event = "event"
        case id = "id"
        case number = "number"
        case owner = "owner"
        case owninggroup = "owninggroup"
        case owningteam = "owningteam"
        case resource = "resource"
        case resourceinstance = "resourceinstance"
        case role = "role"
        case start = "start"
        case type = "_type"
        case url = "url"
    }
}

