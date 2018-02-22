//
//  GlobalVariable.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 31/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation


//extension Sequence  where Generator.Element == [String: AnyObject] {
//    public func groupBy(key: String) -> [String: AnyObject]{
//        let  keys = self.flatMap{($0[key] as! String)}
//        let tempSet = Set<String>(keys)
//        let uniqueKeys = Array(tempSet)
//        var result = [String: AnyObject]()
//        for item in uniqueKeys{
//            let predicate = NSPredicate(format: "SELF.\(key) =[cd] %@", item)
//            let arrFilter = self.filter{predicate.evaluateWithObject($0)}
//            result[item] = arrFilter
//        }
//        return result
//    }
//}

//var resourceList:(section: String, rows: Any) = (section: "section", rows: ["key": "value"])
var SwitchValueList = [String]()
var sectionArray = [SectionObjects]()
var objectArray = [TableViewObjects]()
var userArray = [String]()
var usergroupArray = [String]()
var baseArray = [String]()

struct SectionObjects : Codable {
    
    var sectionName : String!
    var sectionObjects : [JSONAny]
}

struct TableViewObjects : Codable {
    
    var sectionName : String!
    var sectionObjects : [String]
}


struct GlobalVariable {
    static var API_Key: String = "6AED6266671C92209161289C37D109E0"
//    4A0863B77CDA66EAE18095E1947048D9 tom
    
    static var OrganizationURL: String = "https://dewerft.yesplan.be"
    static var URL = String()
    static var ObjectId = String()
    static var ObjectType = String()
    static var TeamId: String = "team%3A1203"
    static var EventFull = String()


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



