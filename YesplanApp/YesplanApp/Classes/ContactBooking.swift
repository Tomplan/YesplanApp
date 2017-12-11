//
//  Contact.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//
import Foundation

class ContactBooking: Codable {
    let contact: Contact
    let id: String
    let owner: Own
    let owninggroup: Own
    let owningteam: Own
    let role: String?
    let type: String
    let url: String
}

extension ContactBooking {
    enum CodingKeys: String, CodingKey {
        case contact = "contact"
        case id = "id"
        case owner = "owner"
        case owninggroup = "owninggroup"
        case owningteam = "owningteam"
        case role = "role"
        case type = "_type"
        case url = "url"
    }
}
