//
//  Contact.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//
import Foundation

class Contact: Codable {
    let address: String
    let addresses: [Address]
    let addresslines: String
    let attributes: Attributes
    let city: String
    let comment: String?
    let contactinfo: [Contactinfo]
    let country: String
    let countrycode: String
    let firstname: String
    let id: String
    let imageurl: JSONNull?
    let jobtitle: String?
    let labels: [JSONAny]
    let languagecode: String
    let lastname: String
    let links: [Link]
    let name: String
    let organization: Organization?
    let person: Organization?
    let owner: Own
    let owninggroup: Own
    let owningteam: Own
    let title: String
    let type: String
    let url: String
    let zipcode: String
}

extension Contact {
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case addresses = "addresses"
        case addresslines = "addresslines"
        case attributes = "attributes"
        case city = "city"
        case comment = "comment"
        case contactinfo = "contactinfo"
        case country = "country"
        case countrycode = "countrycode"
        case firstname = "firstname"
        case id = "id"
        case imageurl = "imageurl"
        case jobtitle = "jobtitle"
        case labels = "labels"
        case languagecode = "languagecode"
        case lastname = "lastname"
        case links = "links"
        case name = "name"
        case organization = "organization"
        case person = "person"
        case owner = "owner"
        case owninggroup = "owninggroup"
        case owningteam = "owningteam"
        case title = "title"
        case type = "_type"
        case url = "url"
        case zipcode = "zipcode"
    }
}


