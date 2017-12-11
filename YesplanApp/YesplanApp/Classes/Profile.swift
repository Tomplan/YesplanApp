//
//  Profile.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Profile: Codable {
    let id: String
    let name: String
    let type: String
    let url: String
    let color: String?
}

extension Profile {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "_type"
        case url = "url"
        case color = "color"
    }
}
