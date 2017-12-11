//
//  Address.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Address: Codable {
    let addresstype: String
    let city: String
    let country: String
    let countrycode: String
    let isdefault: Bool
    let street: [String]
    let zipcode: String
}

extension Address {
    enum CodingKeys: String, CodingKey {
        case addresstype = "addresstype"
        case city = "city"
        case country = "country"
        case countrycode = "countrycode"
        case isdefault = "isdefault"
        case street = "street"
        case zipcode = "zipcode"
    }
}
