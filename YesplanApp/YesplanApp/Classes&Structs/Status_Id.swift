//
//  Status.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

struct Status_Id: Codable {
    let url: String
    let type: String
    let name: String
    let backgroundcolor: String
    let textcolor: String
    let statustypes: [String]
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case type = "_type"
        case name = "name"
        case backgroundcolor = "backgroundcolor"
        case textcolor = "textcolor"
        case statustypes = "statustypes"
    }
    
    func printStatus_Id() {
        print("\t status: ")
        print("\t\t url: \(self.url)")
        print("\t\t type: \(self.type)")
        print("\t\t name: \(self.name)")
        print("\t\t backgroundcolor: \(self.backgroundcolor)")
        print("\t\t textcolor: \(self.textcolor)")
        for statustype in self.statustypes { print("\t\t statustypes: \(statustype)") }
    }
}

extension Status_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Status_Id.self, from: data) else { return nil }
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
