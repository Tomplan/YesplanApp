//
//  Task_Id.swift
//  YesplanApp
//
//  Created by Tom Slegers on 22/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

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
        print("*")
        print("task:")
        if let url = self.url { print("\t url: \(url)") }
        if let id = self.id { print("\t id: \(id)") }
        
        //        print("\t url: \(self.url)")
        //        print("\t id: \(self.id)")
        if let owner = self.owner {
            print("\t owner:")
            owner.printUser_Id() }
        if let owningteam = self.owningteam {
            print("\t owningteam:")
            owningteam.printUsergroup_Id() }
        if let owninggroup = self.owninggroup {
            print("\t owninggroup:")
            owninggroup.printUsergroup_Id() }
        print("\t status: \(self.status)")
        if let name = self.name { print("\t name: \(name)") }
        print("\t team: \(self.team)")
        print("\t cost: \(self.cost)")
        if let due = self.due { print("\t due: \(due)") }
        if let start = self.start { print("\t start: \(start)") }
        if let description = self.description { print("\t description: \(description)") }
        if let event = self.event { print("\t taskEvent: ")
            switch event {
            case .event_Id(let event_Id):
                event_Id.printBase()
            case .group_Id(let group_Id):
                group_Id.printBase()
            case .schedule(let taskSchedule):
                taskSchedule.printTaskSchedule()
            }
        }
        if let assignedby = self.assignedby { print("\t assignedby: \(assignedby)") }
        if let assignedto = self.assignedto { print("\t assignedto: \(assignedto)") }
        if let duration = self.duration { print("\t duration: \(duration)") }
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
        if let name = self.name { print("\t\t name: \(name)") }
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

