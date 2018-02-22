//
//  ResourceBooking.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

typealias eventResourceBookings = [Resourcebooking_Id]

struct Resourcebooking_Id: Codable {
    let url: String
    let id: String
    let owner: User_Id?
    let owningteam: Usergroup_Id?
    let owninggroup: Usergroup_Id?
    let type: String
    let number: Int
    let resource: JSONAny // Resource Location_Id or Resource_Id or Placeholder_Id
    let start: String? // added by tom!!! // timestamp
    let end: String? // added by tom!!! // timestamp
    let actualstart: String? // timestamp
    let actualend: String? // timestamp
    let event: JSONAny // tom // NOT Event_Id, Event_Id or Schedule
    let role: String?
    let resourceinstance: Base? // NOT Resourceinstance_Id
    let children: JSONAny? // (instantiable resource use group | resource set use | free form resource use | bulk resource use)*
    let actualnumber: Int?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case owner = "owner"
        case owningteam = "owningteam"
        case owninggroup = "owninggroup"
        case type = "_type"
        case number = "number"
        case resource = "resource"
        case start = "start"
        case end = "end"
        case actualstart = "actualstart"
        case actualend = "actualend"
        case event = "event"
        case role = "role"
        case resourceinstance = "resourceinstance"
        case children = "children"
        case actualnumber = "actualnumber"
    }
    
    func printResourcebooking_Id() {
        print("\t url: \(self.url)")
//        objectArray.append(TableViewObjects(sectionName: "url", sectionObjects: [url]))
//        print("\t id: \(self.id)")
//        objectArray.append(TableViewObjects(sectionName: "id", sectionObjects: [id]))
//        if let owner = self.owner { print("\t owner:"); owner.printUser_Id() }
//        if let owner = self.owner { owner.printUser_Id(); objectArray.append(TableViewObjects(sectionName: "owner", sectionObjects: userArray)) }
//        if let owningteam = self.owningteam { print("\t owningteam:"); owningteam.printUsergroup_Id() }
//        if let owningteam = self.owningteam { owningteam.printUsergroup_Id(); objectArray.append(TableViewObjects(sectionName: "owningteam",     sectionObjects: usergroupArray)) }
//        if let owninggroup = self.owninggroup { print("\t owninggroup:"); owninggroup.printUsergroup_Id() }
//        if let owninggroup = self.owninggroup { owninggroup.printUsergroup_Id(); objectArray.append(TableViewObjects(sectionName: "owninggroup",     sectionObjects: usergroupArray)) }
        print("\t type: \(self.type)")
//        objectArray.append(TableViewObjects(sectionName: "type", sectionObjects: [self.type]))
//        print("\t number: \(self.number)")
//        objectArray.append(TableViewObjects(sectionName: "number", sectionObjects: [String(describing: number)]))
        print("\t resource:")
        print("\t \(resource)")

        self.resource.printJSONAny()
        
//        if let start = self.start { print("\t start: \(start)") }
//        if let start = self.start { objectArray.append(TableViewObjects(sectionName: "start", sectionObjects: [start])) }
//        if let end = self.end { print("\t end: \(end)") }
//        if let end = self.end { objectArray.append(TableViewObjects(sectionName: "end", sectionObjects: [end])) }
//        if let actualstart = self.actualstart { print("\t actualstart: \(actualstart)") }
//        if let actualstart = self.actualstart { objectArray.append(TableViewObjects(sectionName: "actualstart", sectionObjects: [actualstart])) }
//        if let actualend = self.actualend { print("\t actualend: \(actualend)") }
//        if let actualend = self.actualend { objectArray.append(TableViewObjects(sectionName: "actualend", sectionObjects: [actualend])) }
//        print("\t event:")
//        self.event.printJSONAny()
//        if let role = self.role { print("\t role: \(role)") }
//        if let role = self.role { objectArray.append(TableViewObjects(sectionName: "role", sectionObjects: [role])) }
        if let resourceinstance = self.resourceinstance { print("\t resourceinstance: "); resourceinstance.printBase() }
//        if let resourceinstance = self.resourceinstance { resourceinstance.printBase(); objectArray.append(TableViewObjects(sectionName: "resourceinstance",     sectionObjects: baseArray)) }
        if let children = self.children { print("\t children: ") }
        if let children = self.children { children.printJSONAny() }
//        objectArray.append(TableViewObjects(sectionName: "children", sectionObjects: baseArray)) }
//        if let actualnumber = self.actualnumber { print("\t actualnumber: \(actualnumber)") }
//        if let actualnumber = self.actualnumber { objectArray.append(TableViewObjects(sectionName: "actualnumber", sectionObjects: [String(describing: actualnumber)])) }

    }
    
//    func printEvent_Id_Resourcebooking() {
//        self.resource.printJSONAny()
//        print(self.resource.value)
//        let dictionary = self.resource.value as! [String: Any]
//        dictionary.keys.forEach(<#T##body: (String) throws -> Void##(String) throws -> Void#>)
//         let resourcetype:String = dictionary["resourcetype"]  as! String
//            print(resourcetype)
//            print(self.resource.value)
//            resourceList = (resourcetype, self.resource.value)
////            print(resourceList)
//
//
//
//    }
    
}

extension Resourcebooking_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Resourcebooking_Id.self, from: data) else { return nil }
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
extension Array where Element == Resourcebooking_Id {
    static func from(json: String, using encoding: String.Encoding = .utf8) -> [Resourcebooking_Id]? {
        guard let data = json.data(using: encoding) else { print("chik"); return nil }
        return from(data: data)
    }
    
    static func from(data: Data) -> [Resourcebooking_Id]? {
        let decoder = JSONDecoder()
        return try? decoder.decode([Resourcebooking_Id].self, from: data)
    }
    
    static func from(url urlString: String) -> [Resourcebooking_Id]? {
        guard let url = URL(string: urlString) else { print("ships")
            return nil }
        guard let data = try? Data(contentsOf: url) else { print("ships2")
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

