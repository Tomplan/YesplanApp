//
//  ContactLink.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//
import Foundation

class ContactLink: Codable {
    let attributes: Attributes
    let comment: String
    let contactinfo: [Contactinfo]
    let department: String
    let id: String
    let jobtitle: String
    let labels: [JSONAny]
    let organization: Organization
    let person: Organization
    let type: String
    let url: String
}

extension ContactLink {
    enum CodingKeys: String, CodingKey {
        case attributes = "attributes"
        case comment = "comment"
        case contactinfo = "contactinfo"
        case department = "department"
        case id = "id"
        case jobtitle = "jobtitle"
        case labels = "labels"
        case organization = "organization"
        case person = "person"
        case type = "_type"
        case url = "url"
    }
}
