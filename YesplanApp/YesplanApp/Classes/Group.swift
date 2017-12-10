//
//  Group.swift
//  YesplanApp
//
//  Created by Tom Slegers on 10/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Group: Codable {
    let id: String?
    let name: String?
    let type: String?
    let url: String?
    let description: String?
    let starttime: String?
}

extension Group {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "_type"
        case url = "url"
        case description = "description"
        case starttime = "starttime"
    }
}
