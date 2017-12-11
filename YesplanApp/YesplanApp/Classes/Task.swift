//
//  Task.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Task: Codable {
    let assignedby: String
    let assignedto: String?
    let cost: Int
    let description: String?
    let due: String?
    let duration: String
    let event: Profile?
    let id: String
    let name: String
    let owner: Own
    let owninggroup: Own
    let owningteam: Own
    let start: String?
    let status: String
    let team: String
    let url: String
}


extension Task {
    enum CodingKeys: String, CodingKey {
        case assignedby = "assignedby"
        case assignedto = "assignedto"
        case cost = "cost"
        case description = "description"
        case due = "due"
        case duration = "duration"
        case event = "event"
        case id = "id"
        case name = "name"
        case owner = "owner"
        case owninggroup = "owninggroup"
        case owningteam = "owningteam"
        case start = "start"
        case status = "status"
        case team = "team"
        case url = "url"
    }
}

