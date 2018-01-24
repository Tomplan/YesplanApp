//
//  Pagination.swift
//  YesplanApp
//
//  Created by Tom Slegers on 10/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

struct Pagination: Codable {
    let next: String?
    let expires: String?
    
    enum CodingKeys: String, CodingKey {
        case next = "next"
        case expires = "expires"
    }
    
    func printPagination() {
        print("pagination: ")
        if let next = self.next { print("\t next: \(next)") }
        if let expires = self.expires { print("\t expires: \(expires)") }
    }
}
