//
//  Placeholder.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation
// To parse the JSON, add this file to your project and do:
//
//   let placeholder = Placeholder.from(json: jsonString)!

import Foundation

class Placeholder: Codable {
    let amount: String?
    let costmodels: [Costmodel]?
    let defaultrole: String?
    let description: String?
    let external: Bool?
    let group: String?
    let id: String?
    let name: String?
    let rented: Bool?
    let resourcetype: String?
    let roles: [String]?
    let type: String?
    let url: String?
}


extension Placeholder {
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case costmodels = "costmodels"
        case defaultrole = "defaultrole"
        case description = "description"
        case external = "external"
        case group = "group"
        case id = "id"
        case name = "name"
        case rented = "rented"
        case resourcetype = "resourcetype"
        case roles = "roles"
        case type = "_type"
        case url = "url"
    }
}


