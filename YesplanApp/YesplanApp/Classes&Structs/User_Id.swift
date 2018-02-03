//
//  User_Id.swift
//  YesplanApp
//
//  Created by Tom Slegers on 22/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

struct User_Id: Codable {
    let url: String
    let id: String
    let name: String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case name = "name"
        case email = "email"
    }
    
    func printUser_Id() {
        userArray = []
        print("\t\t url: \(self.url)")
        userArray.append(self.url)
        print("\t\t id: \(self.id)")
        userArray.append(self.id)
        if let name = self.name { print("\t\t name: \(name)");  userArray.append(name) }
        if let email = self.email { print("\t\t email: \(email)");  userArray.append(email) }
    }
}

extension User_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(User_Id.self, from: data) else { return nil }
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
