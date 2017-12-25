//
//  Entry.swift
//  YesplanApp
//
//  Created by Tom Slegers on 18/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation


struct Entry: Codable {
    let starttime: String
    let description: String
}

extension Entry {
    enum CodingKeys: String, CodingKey {
        case starttime = "starttime"
        case description = "description"
    }
}
