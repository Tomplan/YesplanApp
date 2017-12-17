//
//  Resource.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Resource: Codable {
    let active: Bool?
    let amount: Amount?
    let costmodels: [Costmodel]?
    let date: String?
    let defaultrole: String?
    let description: String?
    let external: Bool?
    let group: String?
    let id: String?
    let name: String?
    let owner: Own?
    let owninggroup: Own?
    let owningteam: Own?
    let productcode: String?
    let rented: Bool?
    let resourceinstances: [Resourceinstance]?
    let resourcetype: String?
    let roles: [String]?
    let serialnumber: String?
    let type: String?
    let url: String?
}

extension Resource {
    enum CodingKeys: String, CodingKey {
        case active = "active"
        case amount = "amount"
        case costmodels = "costmodels"
        case date = "date"
        case defaultrole = "defaultrole"
        case description = "description"
        case external = "external"
        case group = "group"
        case id = "id"
        case name = "name"
        case owner = "owner"
        case owninggroup = "owninggroup"
        case owningteam = "owningteam"
        case productcode = "productcode"
        case rented = "rented"
        case resourceinstances = "resourceinstances"
        case resourcetype = "resourcetype"
        case roles = "roles"
        case serialnumber = "serialnumber"
        case type = "_type"
        case url = "url"
    }
}

