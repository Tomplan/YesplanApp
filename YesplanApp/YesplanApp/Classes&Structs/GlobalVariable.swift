//
//  GlobalVariable.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 31/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

var objectArray = [TableViewObjects]()
var userArray = [String]()
var usergroupArray = [String]()
var baseArray = [String]()


struct TableViewObjects : Codable {
    
    var sectionName : String!
    var sectionObjects : [String]
}

struct GlobalVariable {
    static var API_Key: String = "6AED6266671C92209161289C37D109E0"
    static var OrganizationURL: String = "https://dewerft.yesplan.be"
    static var URL = String()
    static var ObjectId = String()
    static var ObjectType = String()
    static var TeamId: String = "team%3A1203"

}
struct YPTableViewObjects : Codable {
    
    var sectionName : String!
    var sectionObjects : [JSONAny]
}

extension YPTableViewObjects {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(YPTableViewObjects.self, from: data) else { return nil }
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



