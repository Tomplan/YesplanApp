//
//  Base.swift
//  YesplanApp
//
//  Created by Tom Slegers on 25/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Base: Codable {
    let id: String
    let name: String
    let url: String
    let type: String?
}

extension Base {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case url = "url"
        case type = "_type"
    }
}
