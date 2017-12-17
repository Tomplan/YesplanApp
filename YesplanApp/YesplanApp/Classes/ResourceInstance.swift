//
//  ResourceInstance.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Resourceinstance: Codable {
    let active: Bool?
    let date: String?
    let id: String?
    let productcode: String?
    let serialnumber: String?
    let type: String?
    let url: String?
}

extension Resourceinstance {
    enum CodingKeys: String, CodingKey {
        case active = "active"
        case date = "date"
        case id = "id"
        case productcode = "productcode"
        case serialnumber = "serialnumber"
        case type = "_type"
        case url = "url"
    }
}

