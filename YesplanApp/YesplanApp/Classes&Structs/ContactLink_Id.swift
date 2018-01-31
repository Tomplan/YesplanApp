//
//  ContactLink.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//
import Foundation

struct Contactlink_Id: Codable {
    let url: String
    let id: String
    let type: String
    let contactinfo: [ContactInfo]? // optional added by TOM
    let comment: String?
    let jobtitle: String?
    let labels: [JSONAny]? // optional added by TOM
    let department: String?
    let organization: Contact_Id? // optional added by TOM
    let person: Contact_Id? // optional added by TOM
    let attributes: Pagination? // optional added by TOM
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case type = "_type"
        case contactinfo = "contactinfo"
        case comment = "comment"
        case jobtitle = "jobtitle"
        case labels = "labels"
        case department = "department"
        case organization = "organization"
        case person = "person"
        case attributes = "attributes"
    }
    
    func printContactlink_Id() {
        print("contactlink:")
        print("\t url: \(self.url)")
        print("\t id: \(self.id)")
        print("\t type: \(self.type)")
        if let contactinfo = self.contactinfo {
            for info in contactinfo {
                info.printContactInfo()
            }
        }
        if let comment = self.comment { print("\t comment: \(comment)") }
        if let jobtitle = self.jobtitle { print("\t jobtitle: \(jobtitle)") }
        if let labels = self.labels {
            print("\t labels: ")
            for label in labels {
                print("\t\t label:  \(label)")
            }
        }
        if let department = self.department { print("\t department: \(department)") }
        if let organization = self.organization {
            print("\t organization:")
            print("\t\t url: \(organization.url)")
            //            print("\t\t id: \(organization.id)")
            //            if let name = organization.name { print("\t\t name: \(name)") }
            //            print("\t\t type: \(organization.type)")
        }
        if let person = self.person {
            print("\t person:")
            print("\t\t url: \(person.url)")
            //            print("\t\t id: \(person.id)")
            //            if let name = person.name { print("\t\t name: \(name)") }
            //            print("\t\t type: \(person.type)")
        }
    }
}

extension Contactlink_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Contactlink_Id.self, from: data) else { return nil }
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
