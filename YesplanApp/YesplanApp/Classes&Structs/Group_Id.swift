//
//  Groups.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation
// To parse the JSON, add this file to your project and do:
//
//   let group = Group.from(json: jsonString)!

import Foundation

struct Group_Id: Codable {
    let url: String
    let id: String
    let owner: User_Id?
    let owningteam: Usergroup_Id?
    let owninggroup: Usergroup_Id?
    let name: String?
    let group: Base?
    let starttime: String? // timestamp Date and time of the start of the event.
    let endtime: String? // timestamp Date and time of the end of the event.
    let startdate: String? // date Date on which the start of the event appears in the calendar.
    let enddate: String? // date Date on which the end of the event appears in the calendar.
    let profile: Base? // NOT Profile_Id, color not transferred by Yesplan in Group_Id
    let status: Base? // Not Status_Id, backgroundcolor,...
    let locations: [Base]
    let production: Base?             // null or Event_Id or Group_Id
    let isproduction: Bool
    let attributes: Pagination? // optional added by TOM
    let type: String
    let profiles: [Base] // NOT Profile_Id, color not transferred by Yesplan in Group_Id
    let statuses: [Base]? // optional added by TOM
    let children: [Child]? // optional added by TOM
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case owner = "owner"
        case owningteam = "owningteam"
        case owninggroup = "owninggroup"
        case name = "name"
        case group = "group"
        case starttime = "starttime"
        case endtime = "endtime"
        case startdate = "startdate"
        case enddate = "enddate"
        case profile = "profile"
        case status = "status"
        case locations = "locations"
        case production = "production"
        case isproduction = "isproduction"
        case attributes = "attributes"
        case type = "_type"
        case profiles = "profiles"
        case statuses = "statuses"
        case children = "children"
    }
    
    func printGroup_Id() {
        print("group:")
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
        if let name = self.name { print("\t name: \(name)") }
        if let group = self.group {
            print("\t group:")
            group.printBase()
        }
        if let starttime = self.starttime { print("\t starttime: \(starttime)") }
        if let endtime = self.endtime { print("\t endtime: \(endtime)") }
        if let startdate = self.startdate { print("\t startdate: \(startdate)") }
        if let enddate = self.enddate { print("\t enddate: \(enddate)") }
        if let profile = self.profile {
            print("\t profile:")
            profile.printBase()
            
        }
        if let status = self.status {
            print("\t status:")
            status.printBase()
        }
        print("\t locations:")
        for location in self.locations {
            print("\t\t location: ")
            location.printBase()
        }
        if let production = self.production {
            print("\t production:")
            production.printBase()
        }
        print("\t isproduction: \(self.isproduction)")
        if let attributes = self.attributes { print("\t attributes: \(attributes)") }
        print("\t type: \(self.type)")
        print("\t profiles:")
        for profile in self.profiles {
            print("\t\t profile: ")
            profile.printBase()
        }
        if let statuses = self.statuses {
            print("\t statuses:")
            for status in statuses {
                print("\t\t status: ")
                status.printBase()
            }
        }
        if let children = self.children {
            print("\t child:")
            for child in children {
                print("\t\t child: ")
                child.printChild()
            }
        }
    }
}

extension Group_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Group_Id.self, from: data) else { return nil }
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
