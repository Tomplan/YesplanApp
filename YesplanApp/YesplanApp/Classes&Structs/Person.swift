//
//  Person.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 31/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation


struct Person: Codable {
    let url: String //
    let id: String  //
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
    let addresses: [Address]?    // optional added by TOM, do not remove
    let type: String
    let title: String?
    let firstname: String?
    let lastname: String?
    let links: [Contactlink_Id]?    // optional added by TOM, do not remove
    let vipcode: String?
    let lastnamepreposition: String?
    let initial: String?
    
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
        case type = "_type"
        case title = "title"
        case firstname = "firstname"
        case lastname = "lastname"
        case links = "links"
        case vipcode = "vipcode"
        case lastnamepreposition = "lastnamepreposition"
        case initial = "initial"
    }
    
    func printPerson() {
        print("*")
        print("person:")
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
        print("\t type: \(self.type)")
        if let title = self.title { print("\t title: \(title)") }
        if let firstname = self.firstname { print("\t firstname: \(firstname)") }
        if let lastname = self.lastname { print("\t lastname: \(lastname)") }
        if let links = self.links {
            for link in links {
                link.printContactlink_Id()
            }
        }
        if let vipcode = self.vipcode { print("\t vipcode: \(vipcode)") }
        if let lastnamepreposition = self.lastnamepreposition { print("\t lastnamepreposition: \(lastnamepreposition)") }
        if let initial = self.initial { print("\t initial: \(initial)") }
        print("*")
    }
}


extension Person {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Person.self, from: data) else { return nil }
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
