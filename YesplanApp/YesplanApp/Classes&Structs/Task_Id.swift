//
//  Task_Id.swift
//  YesplanApp
//
//  Created by Tom Slegers on 22/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

var task: [String : Any] = [:]

struct Task_Id: Codable {
    let url: String?
    let id: String?
    let owner: User_Id?
    let owningteam: Usergroup_Id?
    let owninggroup: Usergroup_Id?
    let status: String
    let name: String?
    let team: String
    let cost: Int
    let due: String? //timestamp
    let start: String? //timestamp
    let description: String?
    let event: TaskEvent?    //
    let assignedby: String?
    let assignedto: String?
    let duration: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case owner = "owner"
        case owningteam = "owningteam"
        case owninggroup = "owninggroup"
        case status = "status"
        case name = "name"
        case team = "team"
        case cost = "cost"
        case due = "due"
        case start = "start"
        case description = "description"
        case event = "event"
        case assignedby = "assignedby"
        case assignedto = "assignedto"
        case duration = "duration"
    }
    
    func printTask_Id() {
//        print("task:")
//        if let url = self.url { print("\t url: \(url)") }
//        if let url = self.url { objectArray.append(TableViewObjects(sectionName: "url", sectionObjects: [url])) }
//        if let id = self.id { print("\t id: \(id)") }
//        if let id = self.id { objectArray.append(TableViewObjects(sectionName: "id", sectionObjects: [id])) }
//        if let owner = self.owner { print("\t owner:") }
//        if let owner = self.owner {owner.printUser_Id(); objectArray.append(TableViewObjects(sectionName: "owner", sectionObjects: userArray)) }
//        if let owningteam = self.owningteam { print("\t owningteam:")}
//        if let owningteam = self.owningteam {owningteam.printUsergroup_Id(); objectArray.append(TableViewObjects(sectionName: "owningteam", sectionObjects: usergroupArray)) }
//        if let owninggroup = self.owninggroup { print("\t owninggroup:")}
//        if let owninggroup = self.owninggroup { owninggroup.printUsergroup_Id(); objectArray.append(TableViewObjects(sectionName: "owninggroup", sectionObjects: usergroupArray)) }
//        print("\t status: \(self.status)")
        objectArray.append(TableViewObjects(sectionName: "status", sectionObjects: [self.status]))
//        if let name = self.name { print("\t name: \(name)") }
        if let name = self.name { objectArray.append(TableViewObjects(sectionName: "name", sectionObjects: [name])) }
//        print("\t team: \(self.team)")
        objectArray.append(TableViewObjects(sectionName: "team", sectionObjects: [self.team]))
//        print("\t cost: \(self.cost)");
//        objectArray.append(TableViewObjects(sectionName: "cost", sectionObjects: [String(describing: self.cost)]))
//        if let due = self.due { print("\t due: \(due)") }
        if let due = self.due { objectArray.append(TableViewObjects(sectionName: "due", sectionObjects: [stringToDate(myDateString: due)])) }
//        if let start = self.start { print("\t start: \(start)") }
        if let start = self.start { objectArray.append(TableViewObjects(sectionName: "start", sectionObjects: [stringToDate(myDateString: start)])) }
//        if let description = self.description { print("\t description: \(description)") }
        if let description = self.description { objectArray.append(TableViewObjects(sectionName: "description", sectionObjects: [description])) }
        if let event = self.event {
//            print("\t taskEvent: ")
            switch event {
            case .event_Id(let event_Id):
                event_Id.printBase()
                objectArray.append(TableViewObjects(sectionName: "event", sectionObjects: baseArray))
            case .group_Id(let group_Id):
                group_Id.printBase()
                objectArray.append(TableViewObjects(sectionName: "event", sectionObjects: baseArray))
            case .schedule(let taskSchedule):
                taskSchedule.printTaskSchedule()
            }
        }
//        if let assignedby = self.assignedby { print("\t assignedby: \(assignedby)") }
        if let assignedby = self.assignedby { objectArray.append(TableViewObjects(sectionName: "assignedby", sectionObjects: [assignedby])) }
//        if let assignedto = self.assignedto { print("\t assignedto: \(assignedto)") }
        if let assignedto = self.assignedto { objectArray.append(TableViewObjects(sectionName: "assignedto", sectionObjects: [assignedto])) }
//        if let duration = self.duration { print("\t duration: \(duration)") }
        if let duration = self.duration { objectArray.append(TableViewObjects(sectionName: "duration", sectionObjects: [duration])) }
    }
}

enum TaskEvent: Codable {
    case event_Id(Base)
    case group_Id(Base)
    case schedule(TaskSchedule)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Base.self) {
            self = .event_Id(x)
            //            x.printBase()
            return
        }
        if let x = try? container.decode(Base.self) {
            self = .group_Id(x)
            //            x.printBase()
            return
        }
        if let x = try? container.decode(TaskSchedule.self) {
            self = .schedule(x)
            //            x.printTaskSchedule()
            return
        }
        throw DecodingError.typeMismatch(Pagination.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Pagination"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .event_Id(let base):
            try container.encode(base)
        case .group_Id(let base):
            try container.encode(base)
        case .schedule(let taskSchedule):
            try container.encode(taskSchedule)
        }
    }
}

struct TaskSchedule: Codable {
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    
    func printTaskSchedule() {
        if let name = self.name { print("\t name: \(name)"); objectArray.append(TableViewObjects(sectionName: "name", sectionObjects: [name])) }
    }
}

extension Task_Id {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Task_Id.self, from: data) else { return nil }
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

protocol ProfileViewModelItem {
    var type: CodingKey { get }
    var rowCount: Int { get }
    var sectionTitle: String  { get }
}

extension ProfileViewModelItem {
    var rowCount: Int {
        return 1
    }
}
