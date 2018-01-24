//
//  Events.swift
//  YesplanApp
//
//  Created by Tom Slegers on 10/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class Events: Codable {
    let data: [Event_Id]
    let pagination: Pagination
}

extension Events {
    static func from(json: String, using encoding: String.Encoding = .utf8) -> Events? {
        guard let data = json.data(using: encoding) else { return nil }
        return Events.from(data: data)
    }
    
    static func from(data: Data) -> Events? {
        let decoder = JSONDecoder()
        return try? decoder.decode(Events.self, from: data)
    }
    
    static func from(url urlString: String) -> Events? {
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

extension Events {
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case pagination = "pagination"
    }
}
