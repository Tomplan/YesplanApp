//
//  Basic.swift
//  YesplanApp
//
//  Created by Tom Slegers on 25/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Basic: Codable {
    let id: String
    let name: String
    let type: String
    let url: String
}

extension Basic {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "_type"
        case url = "url"
    }
}
