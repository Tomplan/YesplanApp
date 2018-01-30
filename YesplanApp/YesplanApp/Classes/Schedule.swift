////
////  Schedule.swift
////  YesplanApp
////
////  Created by Tom Slegers on 18/12/17.
////  Copyright © 2017 TomPlan. All rights reserved.
////
//// To parse the JSON, add this file to your project and do:
////
////   let schedule = Schedule.from(json: jsonString)!
//
//import Foundation
//
//struct Schedule: Codable {
//    let defaultstartidx: Int
//    let defaultstopidx: Int
//    let entries: [Entry]
//    let event: Own
//}
//
//
//// MARK: Top-level extensions -
//
//extension Schedule {
//    static func from(json: String, using encoding: String.Encoding = .utf8) -> Schedule? {
//        guard let data = json.data(using: encoding) else { return nil }
//        return from(data: data)
//    }
//    
//    static func from(data: Data) -> Schedule? {
//        let decoder = JSONDecoder()
//        return try? decoder.decode(Schedule.self, from: data)
//    }
//    
//    static func from(url urlString: String) -> Schedule? {
//        guard let url = URL(string: urlString) else { return nil }
//        guard let data = try? Data(contentsOf: url) else { return nil }
//        return from(data: data)
//    }
//    
//    var jsonData: Data? {
//        let encoder = JSONEncoder()
//        return try? encoder.encode(self)
//    }
//    
//    var jsonString: String? {
//        guard let data = self.jsonData else { return nil }
//        return String(data: data, encoding: .utf8)
//    }
//}
//
//// MARK: Codable extensions -
//
//extension Schedule {
//    enum CodingKeys: String, CodingKey {
//        case defaultstartidx = "defaultstartidx"
//        case defaultstopidx = "defaultstopidx"
//        case entries = "entries"
//        case event = "event"
//    }
//}
//

