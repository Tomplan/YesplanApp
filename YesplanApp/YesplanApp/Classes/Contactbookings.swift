//
//  Contactbookings.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Contactbookings: Codable {
    let data: [Contactbooking]
    let pagination: Pagination
}

extension Contactbookings {
    static func from(json: String, using encoding: String.Encoding = .utf8) -> Contactbookings? {
        guard let data = json.data(using: encoding) else { return nil }
        return Contactbookings.from(data: data)
    }
    
    static func from(data: Data) -> Contactbookings? {
        let decoder = JSONDecoder()
        return try? decoder.decode(Contactbookings.self, from: data)
    }
    
    static func from(url urlString: String) -> Contactbookings? {
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

extension Contactbookings {
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case pagination = "pagination"
    }
}

