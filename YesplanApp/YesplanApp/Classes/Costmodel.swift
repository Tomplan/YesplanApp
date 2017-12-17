//
//  Costmodel.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Costmodel: Codable {
    let account: JSONNull?
    let cost: String?
    let costformula: Costformula?
    let durationdiscount: Discount?
    let invoice: Bool?
    let name: String?
    let price: String?
    let priceformula: Priceformula?
    let profiles: [JSONAny]?
    let purchaseprice: Int?
    let vat: Double?
    let volumediscount: Discount?
}

extension Costmodel {
    enum CodingKeys: String, CodingKey {
        case account = "account"
        case cost = "cost"
        case costformula = "costformula"
        case durationdiscount = "durationdiscount"
        case invoice = "invoice"
        case name = "name"
        case price = "price"
        case priceformula = "priceformula"
        case profiles = "profiles"
        case purchaseprice = "purchaseprice"
        case vat = "vat"
        case volumediscount = "volumediscount"
    }
}
