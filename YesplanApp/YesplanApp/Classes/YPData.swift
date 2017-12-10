//
//  YPData.swift
//  YesplanApp
//
//  Created by Tom Slegers on 10/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

class YPData: Codable {
    let data: [Event]
    let pagination: Pagination
}

extension YPData {
    static func from(json: String, using encoding: String.Encoding = .utf8) -> YPData? {
        guard let data = json.data(using: encoding) else { return nil }
        return YPData.from(data: data)
    }
    
    static func from(data: Data) -> YPData? {
        let decoder = JSONDecoder()
        return try? decoder.decode(YPData.self, from: data)
    }
    
    static func from(url urlString: String) -> YPData? {
        guard let url = URL(string: urlString) else {
            print("no url")
            return nil }
        guard let data = try? Data(contentsOf: url) else {
            print("no data")
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

extension YPData {
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case pagination = "pagination"
    }
}
