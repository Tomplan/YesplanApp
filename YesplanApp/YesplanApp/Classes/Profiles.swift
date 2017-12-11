//
//  Profiles.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Profiles: Codable {
    let data: [Profile]
    let pagination: Pagination
}

extension Profiles {
    static func from(json: String, using encoding: String.Encoding = .utf8) -> Profiles? {
        guard let data = json.data(using: encoding) else { return nil }
        return Profiles.from(data: data)
    }
    
    static func from(data: Data) -> Profiles? {
        let decoder = JSONDecoder()
        return try? decoder.decode(Profiles.self, from: data)
    }
    
    static func from(url urlString: String) -> Profiles? {
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

extension Profiles {
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case pagination = "pagination"
    }
}

