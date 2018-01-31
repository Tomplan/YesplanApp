//
//  Discount.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

struct Discount_Formula: Codable {
    let type: String
    let notation: String
    let rates: [[Int]]
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case notation = "notation"
        case rates = "rates"
    }
    
    func printDiscount_Formula() {
        print("\t discount_formula: ")
        print("\t\t type: \(self.type)")
        print("\t\t notation: \(self.notation)")
        print("\t\t rates: \(self.rates)")
    }
}
