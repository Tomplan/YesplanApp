//
//  ResourceBooking.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

struct Resourcebooking_Id: Codable {
    let url: String
    let id: String
    let owner: User_Id?
    let owningteam: Usergroup_Id?
    let owninggroup: Usergroup_Id?
    let type: String
    let number: Int
    let resource: JSONAny // Resource Location_Id or Resource_Id or Placeholder_Id
    let start: String // timestamp
    let end: String // timestamp
    let actualstart: String? // timestamp
    let actualend: String? // timestamp
    let event: JSONAny // NOT Event_Id, Event_Id or Schedule
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
        print("resourcebooking:")
        print("\t url: \(self.url)")
        print("\t id: \(self.id)")
        if let owner = self.owner {
            print("\t owner:")
            owner.printUser_Id() }
        if let owningteam = self.owningteam {
            print("\t owningteam:")
            owningteam.printUsergroup_Id() }
        if let owninggroup = self.owninggroup {
            print("\t owninggroup:")
            owninggroup.printUsergroup_Id() }
        print("\t type: \(self.type)")
        print("\t number: \(self.number)")
        print("\t resource:")
//        resource.printJSONAny
        print("\t start: \(self.start)")
        print("\t end: \(self.end)")
        if let actualstart = self.actualstart { print("\t actualstart: \(actualstart)") }
        if let actualend = self.actualend { print("\t actualend: \(actualend)") }
        print("\t event:")
//        event.printJSONAny
        if let role = self.role { print("\t role: \(role)") }
        if let resourceinstance = self.resourceinstance { print("\t resourceinstance: ")
            resourceinstance.printBase() }
        if let children = self.children { print("\t children: ")
            children.printJSONAny()
        }
        if let actualnumber = self.actualnumber { print("\t actualnumber: \(actualnumber)") }
    }
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


