//
//  Child.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation


struct Child: Codable {
    let url: String
    let id: String
    let name: String
    let group: Base
    let production: Base?
    let isproduction: Bool
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case name = "name"
        case group = "group"
        case production = "production"
        case isproduction = "isproduction"
        case type = "_type"
    }
    
    func printChild() {
        print("child:")
        print("\t url: \(self.url)")
        print("\t id: \(self.id)")
        print("\t name: \(self.name)")
        print("\t group:")
        group.printBase()
        if let production = self.production {
            print("\t production:")
            production.printBase()
        }
        print("\t isproduction: \(self.isproduction)")
        print("\t type: \(self.type)")
    }
}

extension Child {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Child.self, from: data) else { return nil }
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

