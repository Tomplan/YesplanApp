//
//  ResourceInstance.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

struct Resourceinstance_Id: Codable {
    let type: String
    let id: String
    let url: String
    let resource: Base? // NOT Resource_Id
    let active: Bool?
    let date: String?
    let productcode: String?
    let serialnumber: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case id = "id"
        case url = "url"
        case resource = "resource"
        case active = "active"
        case date = "date"
        case productcode = "productcode"
        case serialnumber = "serialnumber"
    }
    
    func printResourceinstance_Id() {
        print("\t type: \(self.type)")
        print("\t id: \(self.id)")
        print("\t url: \(self.url)")
        if let resource = self.resource { resource.printBase() }
        if let active = self.active { print("\t active: \(active)") }
        if let date = self.date { print("\t date: \(date)") }
        if let productcode = self.productcode { print("\t productcode: \(productcode)") }
        if let serialnumber = self.serialnumber { print("\t serialnumber: \(serialnumber)") }
    }
}

extension Resourceinstance_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Resourceinstance_Id.self, from: data) else { return nil }
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
