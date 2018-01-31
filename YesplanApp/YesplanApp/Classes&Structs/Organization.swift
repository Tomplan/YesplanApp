//
//  Organisation.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation


struct Organization: Codable {
    let url: String
    let id: String
    let owner: User_Id?
    let owningteam: Usergroup_Id?
    let owninggroup: Usergroup_Id?
    let contactinfo: [ContactInfo]? // optional added by TOM, do not remove
    let comment: String?
    let address: String?
    let labels: [String]? // optional added by TOM, do not remove
    let addresslines: String? // optional added by TOM, do not remove
    let zipcode: String?
    let country: String?
    let countrycode: String?
    let languagecode: String?
    let city: String?
    let name: String?
    let attributes: Pagination? // optional added by TOM, do not remove
    let imageurl: String?
    let addresses: [Address]?    // optional added by TOM
    let _type: String? // optional added by TOM
    let type: String?
    let vat: String?
    let links: [Contactlink_Id]?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case owner = "owner"
        case owningteam = "owningteam"
        case owninggroup = "owninggroup"
        case contactinfo = "contactinfo"
        case comment = "comment"
        case address = "address"
        case labels = "labels"
        case addresslines = "addresslines"
        case zipcode = "zipcode"
        case country = "country"
        case countrycode = "countrycode"
        case languagecode = "languagecode"
        case city = "city"
        case name = "name"
        case attributes = "attributes"
        case imageurl = "imageurl"
        case addresses = "addresses"
        case _type = "_type"
        case type = "type"
        case vat = "vat"
        case links = "links"
    }
    
    
    func printOrganization() {
        print("*")
        print("organization:")
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
        if let contactinfo = self.contactinfo {
            print("\t contactinfo: ")
            for info in contactinfo {
                info.printContactInfo()
            }
        }
        if let comment = self.comment { print("\t comment: \(comment)") }
        if let address = self.address { print("\t address: \(address)") }
        if let labels = self.labels {
            print("\t labels: ")
            for label in labels {
                print("\t\t label:  \(label)")
            }
        }
        if let addresslines = self.addresslines { print("\t addresslines: \(addresslines)") }
        if let zipcode = self.zipcode { print("\t zipcode: \(zipcode)") }
        if let country = self.country { print("\t country: \(country)") }
        if let countrycode = self.countrycode { print("\t countrycode: \(countrycode)") }
        if let languagecode = self.languagecode { print("\t languagecode: \(languagecode)") }
        if let city = self.city { print("\t city: \(city)") }
        if let name = self.name { print("\t name: \(name)") }
        if let attributes = self.attributes { print("\t attributes: \(attributes)") }
        if let imageurl = self.imageurl { print("\t imageurl: \(imageurl)") }
        if let addresses = self.addresses {
            print("\t addressess: ")
            for address in addresses {
                print("\t address: ")
                address.printAddress()
            }
        }
        if let _type = self._type { print("\t type: \(_type)") }
        if let type = self.type { print("\t type: \(type)") }
        if let vat = self.vat { print("\t vat: \(vat)") }
        if let links = self.links {
            for link in links {
                link.printContactlink_Id()
            }
        }
        print("*")
    }
}


extension Organization{
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Organization.self, from: data) else { return nil }
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
