//
//  Schedules.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 30/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   guard let schedules = try Schedules(json) else { ... }

import Foundation

struct Schedules: Codable {
    let pagination: Pagination
    let data: [Schedule]
}

struct Schedule: Codable {
    let defaultstartidx, defaultstopidx: Int?
    let entries: [Entry]
    let event: Base
}

struct Entry: Codable {
    let starttime, description: String
}



// MARK: Convenience initializers

extension Schedules {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Schedules.self, from: data) else { return nil }
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


extension Schedule {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Schedule.self, from: data) else { return nil }
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

extension Entry {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Entry.self, from: data) else { return nil }
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
