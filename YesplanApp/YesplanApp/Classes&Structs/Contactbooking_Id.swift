//
//  Contact.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//
import Foundation

struct Contactbooking_Id: Codable {
    let url: String
    let id: String
    let owner: User_Id?
    let owningteam: Usergroup_Id?
    let owninggroup: Usergroup_Id?
    let type: ContactbookingType
    let role: String?
    let contact: Contact // Contact_Id
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case owner = "owner"
        case owningteam = "owningteam"
        case owninggroup = "owninggroup"
        case type = "_type"
        case role = "role"
        case contact = "contact"
    }
    
    func printContactbooking_Id() {
        print("contactbooking:")
        print("\t url: \(self.url)")
        print("\t id: \(self.id)")
        if let owner = self.owner {
            print("\t owner:")
            owner.printUser_Id() }
        if let owningteam = self.owningteam {
            print("\t owningteam:")
            owningteam.printUsergroup_Id() }
        if let owninggroup = self.owninggroup {
            print("\t owninggroup:")
            owninggroup.printUsergroup_Id() }
        print("\t type: ")
        switch self.type {
        case .type:
            print("\t\t contactbooking")
        }
        if let role = self.role { print("\t role: \(role)") }
        print("\t contact: ")
        self.contact.printContact()
    }
}

extension Contactbooking_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Contactbooking_Id.self, from: data) else { return nil }
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
