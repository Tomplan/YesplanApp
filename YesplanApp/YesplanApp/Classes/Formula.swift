//
//  Formula.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Formula: Codable {
    let amount: Int?
    let includesvat: Bool?
    let per: String?
}

extension Formula {
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case includesvat = "includesvat"
        case per = "per"
    }
}
