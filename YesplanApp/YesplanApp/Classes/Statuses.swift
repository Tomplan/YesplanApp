//
//  Statuses.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Statuses: Codable {
    let data: [Status]
    let pagination: Pagination
}

extension Statuses {
    static func from(json: String, using encoding: String.Encoding = .utf8) -> Statuses? {
        guard let data = json.data(using: encoding) else { return nil }
        return Statuses.from(data: data)
    }
    
    static func from(data: Data) -> Statuses? {
        let decoder = JSONDecoder()
        return try? decoder.decode(Statuses.self, from: data)
    }
    
    static func from(url urlString: String) -> Statuses? {
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

extension Statuses {
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case pagination = "pagination"
    }
}
