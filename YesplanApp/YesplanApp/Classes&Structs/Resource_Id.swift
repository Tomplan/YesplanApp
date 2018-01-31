//
//  Resource_Id.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 31/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation


struct Resource_Id: Codable {
    let url: String
    let id: String
    let resourcetype: String
    let name: String
    let group: String?
    let roles: [String]
    let description: String?
    let external: Bool
    let rented: Bool
    let costmodels: [Costmodel]
    let defaultrole: String?
    let amount: JSONAny
    let owner: User_Id?
    let owningteam: Usergroup_Id?
    let owninggroup: Usergroup_Id?
    let type: String?
    let resourceinstances: [Resourceinstance_Id]?
    let active: Bool?
    let date: String?
    let productcode: String?
    let serialnumber: String?
    let resources: JSONAny? //  TO CHECK
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case resourcetype = "resourcetype"
        case name = "name"
        case group = "group"
        case roles = "roles"
        case description = "description"
        case external = "external"
        case rented = "rented"
        case costmodels = "costmodels"
        case defaultrole = "defaultrole"
        case amount = "amount"
        case owner = "owner"
        case owningteam = "owningteam"
        case owninggroup = "owninggroup"
        case type = "_type"
        case resourceinstances = "resourceinstances"
        case active = "active"
        case date = "date"
        case productcode = "productcode"
        case serialnumber = "serialnumber"
        case resources = "resources" // TO CHECK
    }
    
    func printResource_Id() {
        print("resource: ")
        print("\t url: \(self.url)")
        print("\t id: \(self.id)")
        print("\t resourcetype: \(self.resourcetype)")
        print("\t name: \(self.name)")
        if let group = self.group { print("\t group: \(group)") }
        print("\t roles: ")
        for role in self.roles {
            print("\t\t role: \(role)") }
        if let description = self.description { print("\t description: \(description)") }
        print("\t external: \(self.external)")
        print("\t rented: \(self.rented)")
        print("\t costmodels: "); for costmodel in self.costmodels { costmodel.printCostmodel() }
        if let defaultrole = self.defaultrole { print("\t defaultrole: \(defaultrole)") }
        print("\t amount: "); self.amount.printJSONAny()
        if let owner = self.owner {
            print("\t owner:")
            owner.printUser_Id() }
        if let owningteam = self.owningteam {
            print("\t owningteam:")
            owningteam.printUsergroup_Id() }
        if let owninggroup = self.owninggroup {
            print("\t owninggroup:")
            owninggroup.printUsergroup_Id() }
        if let type = self.type { print("\t type: \(type)") }
        if let resourceinstances = self.resourceinstances { print("\t resourceinstances: ")
            for resourceinstance in resourceinstances { resourceinstance.printResourceinstance_Id() }
        }
        if let active = self.active { print("\t active: \(active)") }
        if let date = self.date { print("\t date: \(date)") }
        if let productcode = self.productcode { print("\t productcode: \(productcode)") }
        if let serialnumber = self.serialnumber { print("\t serialnumber: \(serialnumber)") }
        if let resources = self.resources { print("\t resources: ");  resources.printJSONAny() }
    }
}
extension Resource_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Resource_Id.self, from: data) else { return nil }
        self = me
    }
    
    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    init?(url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
