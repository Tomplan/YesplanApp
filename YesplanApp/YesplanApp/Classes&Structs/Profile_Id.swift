//
//  Profile.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation


struct Profile_Id: Codable {
    let url: String
    let type: String
    let id: String
    let name: String
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case type = "_type"
        case id = "id"
        case name = "name"
        case color = "color"
    }
    
    func printProfile_Id() {
        print("profile:")
        print("\t url: \(self.url)")
        print("\t type: \(self.type)")
        print("\t id: \(self.id)")
        print("\t name: \(self.name)")
        print("\t color: \(self.color)")
    }
}

extension Profile_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Profile_Id.self, from: data) else { return nil }
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

