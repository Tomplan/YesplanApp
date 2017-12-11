//
//  Child.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Child: Codable {
    let group: Location
    let id: String
    let isproduction: Bool
    let name: String
    let production: JSONNull?
    let type: String
    let url: String
}

extension Child {
    enum CodingKeys: String, CodingKey {
        case group = "group"
        case id = "id"
        case isproduction = "isproduction"
        case name = "name"
        case production = "production"
        case type = "_type"
        case url = "url"
    }
}
