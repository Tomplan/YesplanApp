//
//  Contactbookings.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation


struct Contactbookings: Codable {
    let pagination: Pagination
    let data: [Contactbooking_Id]
    
    enum CodingKeys: String, CodingKey {
        case pagination = "pagination"
        case data = "data"
    }
    
    func printContactbookings() {
        self.pagination.printPagination()
        print("contactbookings: ")
        for contactbooking in self.data {
            contactbooking.printContactbooking_Id()
        }
    }
}

extension Contactbookings {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Contactbookings.self, from: data) else { return nil }
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
