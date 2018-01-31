//
//  Contact_Id.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 31/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation


struct Contact_Id: Codable {
    let url: String
    let id: String
    let name: String?
    let type: ContactType
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case name = "name"
        case type = "_type"
    }
    
    func printContact_Id() {
        print("contact:")
        print("\t url: \(self.url)")
        print("\t id: \(self.id)")
        if let name = self.name { print("\t name: \(name)") }
        print("\t type: ")
        switch self.type {
        case .organization:
            let json = "\(self.url)?api_key=6AED6266671C92209161289C37D109E0"
            if let organization = Organization(url: json) {
                organization.printOrganization()
            }
        case .person:
            let json = "\(self.url)?api_key=6AED6266671C92209161289C37D109E0"
            if let person = Person(url: json) {
                person.printPerson()
            }
        case .contactlink:
            print("contactlink: ")
            
        }
    }
}

extension Contact_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Contact_Id.self, from: data) else { return nil }
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
