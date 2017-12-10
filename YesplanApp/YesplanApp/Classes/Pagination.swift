//
//  Pagination.swift
//  YesplanApp
//
//  Created by Tom Slegers on 10/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Pagination: Codable {
    let expires: String?
    let next: String?
}

extension Pagination {
    enum CodingKeys: String, CodingKey {
        case expires = "expires"
        case next = "next"
    }
}
