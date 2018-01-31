//
//  Contact.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//
import Foundation

struct Contact: Codable {
    let url: String?
    let id: String?
    let name: String?
    let type: ContactType
    let jobtitle: String?
    let organization: Base?
    let person: Base?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case name = "name"
        case type = "_type"
        case jobtitle = "jobtitle"
        case organization = "organization"
        case person = "person"
    }
    
    func printContact() {
        if let url = self.url { print("\t\t url: \(url)") }
        if let id = self.id { print("\t\t id: \(id)") }
        if let name = self.name { print("\t\t name: \(name)") }
        print("\t\t type: ")
        switch self.type {
        case .organization:
            if let url = self.url {
                let json = "\(url)?api_key=6AED6266671C92209161289C37D109E0"
                if let organization = Organization(url: json) {
                    organization.printOrganization()
                }}
        case .person:
            if let url = self.url {
                let json = "\(url)?api_key=6AED6266671C92209161289C37D109E0"
                if let person = Person(url: json) {
                    person.printPerson()
                }}
        case .contactlink:
            print("contactlink: ")
        }
        if let jobtitle = self.jobtitle { print("\t\t jobtitle: \(jobtitle)") }
        if let organization = self.organization { print("\t\t organization: ")
            organization.printBase() }
        if let person = self.person { print("\t\t person: ")
            person.printBase()}
    }
    
}

extension Contact {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Contact.self, from: data) else { return nil }
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


