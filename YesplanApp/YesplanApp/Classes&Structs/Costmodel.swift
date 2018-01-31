//
//  Costmodel.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

struct Costmodel: Codable {
    let name: String?
    let cost: String
    let costformula: Formula
    let price: String
    let priceformula: Formula
    let account: String?
    let invoice: Bool
    let durationdiscount: Discount_Formula
    let volumediscount: Discount_Formula
    let purchaseprice: Double
    let vat: Double
    let profiles: [JSONAny]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case cost = "cost"
        case costformula = "costformula"
        case price = "price"
        case priceformula = "priceformula"
        case account = "account"
        case invoice = "invoice"
        case durationdiscount = "durationdiscount"
        case volumediscount = "volumediscount"
        case purchaseprice = "purchaseprice"
        case vat = "vat"
        case profiles = "profiles"
    }
    
    func printCostmodel() {
        print("\t costmodel: ")
        if let name = self.name { print("\t\t name: \(name)") }
        print("\t\t cost: \(self.cost)")
        print("\t\t costformula: ")
        self.costformula.printFormula()
        print("\t\t price: \(self.price)")
        print("\t\t priceformula: ")
        self.priceformula.printFormula()
        if let account = self.account { print("\t\t account: \(account)") }
        print("\t\t invoice: \(self.invoice)")
        print("\t\t durationdiscount: "); self.durationdiscount.printDiscount_Formula()
        print("\t\t volumediscount: "); self.volumediscount.printDiscount_Formula()
        print("\t\t purchaseprice: \(self.purchaseprice)")
        print("\t\t vat: \(self.vat)")
        print("\t\t profiles: "); for profile in self.profiles { profile.printJSONAny() }
    }
}
