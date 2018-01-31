//
//  Location.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

struct Location_Id: Codable {
    let url: String
    let id: String
    let resourcetype: String
    let name: String
    let group: String?
    let roles: [JSONAny]
    let description: String?
    let external: Bool
    let rented: Bool
    let costmodels: [Costmodel]?
    let defaultrole: String?
    let amount: Int?                // or String
    let owningteam: Usergroup_Id?
    let owninggroup: Usergroup_Id?
    let abbreviation: String
    let type: String                // “location”
    
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
        case owningteam = "owningteam"
        case owninggroup = "owninggroup"
        case abbreviation = "abbreviation"
        case type = "_type"
    }
    
    func printLocation_Id() {
        print("location:")
        print("\t url: \(self.url)")
        print("\t id: \(self.id)")
        print("\t resourcetype: \(self.resourcetype)")
        print("\t name: \(self.name)")
        if let group = self.group { print("\t group: \(group)") }
        //        if let roles = self.roles {
        //            print("\t roles: ")
        //            for role in roles {
        //                info.printContactInfo()
        //            }
        //        }
        if let description = self.description { print("\t description: \(description)") }
        print("\t external: \(self.external)")
        print("\t rented: \(self.rented)")
        if let defaultrole = self.defaultrole { print("\t defaultrole: \(defaultrole)") }
        if let amount = self.amount { print("\t amount: \(amount)") }
        if let owningteam = self.owningteam {
            print("\t owningteam:")
            owningteam.printUsergroup_Id() }
        if let owninggroup = self.owninggroup {
            print("\t owninggroup:")
            owninggroup.printUsergroup_Id() }
    }
}

extension Location_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Location_Id.self, from: data) else { return nil }
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
