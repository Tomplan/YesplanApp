//
//  ContactInfo.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

struct ContactInfo: Codable {
    let type: String?
    let value: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case value = "value"
    }
    
    func printContactInfo() {
        if let type = self.type {
            if let value = self.value { print("\t\t \(type): \(value)") }
        }
    }
}


extension ContactInfo {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(ContactInfo.self, from: data) else { return nil }
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

