//
//  Resource.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation


struct Resource: Codable {
    let url: String // optional added by Tom
    let id: String // optional added by Tom
    let resourcetype: String // optional added by Tom
    let name: String // optional added by Tom
    let group: String? // optional added by Tom
    let roles: [String] // optional added by Tom
    let type: String? // optional added by Tom
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case resourcetype = "resourcetype"
        case name = "name"
        case group = "group"
        case roles = "roles"
        case type = "_type"
    }
    
    func printResource() {
        print("resource: ")
        print("\t url: \(self.url)")
        print("\t id: \(self.id)")
        print("\t resourcetype: \(self.resourcetype)")
        print("\t name: \(self.name)")
        if let group = self.group { print("\t group: \(group)") }
        print("\t roles: ")
        for role in self.roles {
            print("\t\t role: \(role)") }
        if let type = self.type { print("\t type: \(type)") }
        
    }
}


extension Resource {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Resource.self, from: data) else { return nil }
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
