//
//  Placeholder.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

struct Resourceplaceholder_Id: Codable {
    let url: String
    let id: String
    let resourcetype: String // optional added by TOM
    let name: String // optional added by TOM
    let group: String?
    let roles: [String] // optional added by TOM
    let description: String?
    let external: Bool // optional added by TOM
    let rented: Bool // optional added by TOM
    let costmodels: [Costmodel] // optional added by TOM
    let defaultrole: String // optional added by TOM
    let amount: String?
    let type: String
    
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
        case type = "_type"
    }
    
    func printResourceplaceholder_Id() {
        print("resourceplaceholder:")
        print("\t url: \(self.url)")
        print("\t id: \(self.id)")
        print("\t resourcetype: \(self.resourcetype)")
        print("\t name: \(self.name)")
        if let group = self.group { print("\t group: \(group)") }
        print("\t roles: ")
        for role in self.roles { print("\t \(role)") }
        if let description = self.description { print("\t description: \(description)") }
        print("\t external: \(self.external)")
        print("\t rented: \(self.rented)")
        print("\t costmodels: ")
        for costmodel in self.costmodels { costmodel.printCostmodel() }
        print("\t defaultrole: \(self.defaultrole)")
        if let amount = self.amount { print("\t amount: \(amount)") }
        print("\t type: \(self.type)")
    }
}


extension Resourceplaceholder_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Resourceplaceholder_Id.self, from: data) else { return nil }
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

