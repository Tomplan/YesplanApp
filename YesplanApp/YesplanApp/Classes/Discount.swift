//
//  Discount.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Discount: Codable {
    let notation: String?
    let rates: [[Int]]?
    let type: String?
}

extension Discount {
    enum CodingKeys: String, CodingKey {
        case notation = "notation"
        case rates = "rates"
        case type = "type"
    }
}
