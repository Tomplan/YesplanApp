//
//  Resources.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 31/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

struct Resources: Codable {
    let pagination: Pagination
    let data: [Resource_Id]
    
    enum CodingKeys: String, CodingKey {
        case pagination = "pagination"
        case data = "data"
    }
    
    func printResources() {
        self.pagination.printPagination()
        print("resources: ")
        for resource in self.data {
            resource.printResource_Id()
        }
    }
}

extension Resources {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Resources.self, from: data) else { return nil }
        self = me
    }
    
    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    init?(url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
