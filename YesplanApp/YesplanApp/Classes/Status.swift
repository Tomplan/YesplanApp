//
//  Status.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Status: Codable {
    let name: String?
    let type: String?
    let url: String?
    let backgroundcolor: String?
    let textcolor: String?
//    let statustypes: String?
}

extension Status {
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "_type"
        case url = "url"
        case backgroundcolor = "backgroundcolor"
        case textcolor = "textcolor"
//        case statustypes = "statustypes"
    }
}
