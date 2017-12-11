//
//  ContactInfo.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Contactinfo: Codable {
    let type: String
    let value: String
}

extension Contactinfo {
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case value = "value"
    }
}

