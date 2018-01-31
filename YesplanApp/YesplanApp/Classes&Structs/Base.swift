//
//  Base.swift
//  YesplanApp
//
//  Created by Tom Slegers on 22/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

struct Base: Codable {
    let url: String
    let id: String?
    let name: String?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case name = "name"
        case type = "_type"
    }
    
    func printBase() {
        print("\t\t url: \(self.url)")
        if let id = self.name { print("\t\t id: \(id)") }
        if let name = self.name { print("\t\t name: \(name)") }
        if let type = self.type { print("\t\t email: \(type)") }
    }
}

extension Base {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Base.self, from: data) else { return nil }
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
