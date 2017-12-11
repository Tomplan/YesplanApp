//
//  Location.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Location: Codable {
    let id: String
    let name: String
    let type: String
    let url: String
}

extension Location {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "_type"
        case url = "url"
    }
}
