//
//  Resourcebookings.swift
//  YesplanApp
//
//  Created by Tom Slegers on 13/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

import Foundation

class Resourcebookings: Codable {
    let data: [Resourcebooking]
    let pagination: Pagination
}

extension Resourcebookings {
    static func from(json: String, using encoding: String.Encoding = .utf8) -> Resourcebookings? {
        guard let data = json.data(using: encoding) else { return nil }
        return Resourcebookings.from(data: data)
    }
    
    static func from(data: Data) -> Resourcebookings? {
        let decoder = JSONDecoder()
        return try? decoder.decode(Resourcebookings.self, from: data)
    }
    
    static func from(url urlString: String) -> Resourcebookings? {
        guard let url = URL(string: urlString) else {
            return nil }
        guard let data = try? Data(contentsOf: url) else {
            return nil }
        return from(data: data)
    }
    
    var jsonData: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    var jsonString: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

extension Resourcebookings {
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case pagination = "pagination"
    }
}
