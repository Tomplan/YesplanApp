//
//  Link.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation


struct LinkAttachment: Codable {
    let comment: String?
    let date: String?
    let username: String?
    let dataurl: String?
    
    enum CodingKeys: String, CodingKey {
        case comment = "comment"
        case date = "date"
        case username = "username"
        case dataurl = "dataurl"
    }
    
    func printLinkAttachment() {
        if let comment = self.comment { print("\t\t\t\t\t comment: \(comment)") }
        if let date = self.date { print("\t\t\t\t\t date: \(date)") }
        if let username = self.username { print("\t\t\t\t\t username: \(username)") }
        if let dataurl = self.dataurl { print("\t\t\t\t\t dataurl: \(dataurl)") }
    }
}

extension LinkAttachment {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(LinkAttachment.self, from: data) else { return nil }
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

