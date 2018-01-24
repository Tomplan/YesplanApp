//
//  Usergroup_Id.swift
//  YesplanApp
//
//  Created by Tom Slegers on 22/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

struct Usergroup_Id: Codable {
    let url: String
    let id: String
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case name = "name"
    }
    
    func printUsergroup_Id() {
        print("\t\t url: \(self.url)")
        print("\t\t id: \(self.id)")
        if let name = self.name { print("\t\t name: \(name)") }
    }
}

extension Usergroup_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Usergroup_Id.self, from: data) else { return nil }
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
