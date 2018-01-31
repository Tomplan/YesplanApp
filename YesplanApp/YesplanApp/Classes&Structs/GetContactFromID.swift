////
////  GetContactFromID.swift
////  YesplanApp
////
////  Created by Tom Slegers on 25/12/17.
////  Copyright © 2017 TomPlan. All rights reserved.
////
//
//import Foundation
//// To parse the JSON, add this file to your project and do:
////
////   let contactFromID = ContactFromID.from(json: jsonString)!
//
//import Foundation
//
//  struct ContactFromID: Codable {
//    let event: Event
//    let definitions: Definitions
//    let groups: [Group]
//}
//
//     struct Group: Codable {
//        let name: String
//        let keyword: String
//        let children: [GroupChild]
//    }
//
//     struct GroupChild: Codable {
//        let name: String
//        let keyword: String
//        let children: [ChildChild]?
//        let type: String?
//        let value: JSONNull?
//    }
//
//     struct ChildChild: Codable {
//        let name: String
//        let keyword: String
//        let type: PurpleType
//        let value: ValueUnion
//        let options: [String]?
//    }
//
//     enum ValueUnion: Codable {
//        case integer(Int)
//        case string(String)
//        case stringArray([String])
//        case valueClass(ValueClass)
//        case null
//    }
//
//     struct ValueClass: Codable {
//        let url: String?
//        let id: String?
//        let type: String?
//        let contact: Contact?
//        let originalname: String?
//        let comment: JSONNull?
//        let date: String?
//        let username: String?
//        let datatype: String?
//        let dataurl: String?
//    }
//
//     struct Contact: Codable {
//        let url: String
//        let id: String
//        let name: String?
//        let type: String
//        let jobtitle: String?
//        let organization: Event?
//        let person: Event?
//    }
//
//     enum PurpleType: Codable {
//        case attachment
//        case checkbox
//        case contact
//        case date
//        case dateAndTime
//        case dropdown
//        case label
//        case labels
//        case number
//        case publicationTrigger
//        case remoteInfo
//        case resource
//        case string
//        case text
//        case yN
//    }
//
//     struct Event: Codable {
//        let url: String
//        let id: String
//        let name: String
//        let type: String
//    }
//
//     struct Definitions: Codable {
//        let url: String
//    }
//
//// MARK: Top-level extensions -
//
//extension ContactFromID {
//    static func from(json: String, using encoding: String.Encoding = .utf8) -> ContactFromID? {
//        guard let data = json.data(using: encoding) else { return nil }
//        return from(data: data)
//    }
//    
//    static func from(data: Data) -> ContactFromID? {
//        let decoder = JSONDecoder()
//        return try? decoder.decode(ContactFromID.self, from: data)
//    }
//    
//    static func from(url urlString: String) -> ContactFromID? {
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
//extension ContactFromID {
//    enum CodingKeys: String, CodingKey {
//        case event = "event"
//        case definitions = "definitions"
//        case groups = "groups"
//    }
//}
//
//extension Group {
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case keyword = "keyword"
//        case children = "children"
//    }
//}
//
//extension GroupChild {
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case keyword = "keyword"
//        case children = "children"
//        case type = "type"
//        case value = "value"
//    }
//}
//
//extension ChildChild {
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case keyword = "keyword"
//        case type = "type"
//        case value = "value"
//        case options = "options"
//    }
//}
//
//extension ValueUnion {
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(Int.self) {
//            self = .integer(x)
//            return
//        }
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        if let x = try? container.decode(ValueClass.self) {
//            self = .valueClass(x)
//            return
//        }
//        if let x = try? container.decode([String].self) {
//            self = .stringArray(x)
//            return
//        }
//        if container.decodeNil() {
//            self = .null
//            return
//        }
//        throw DecodingError.typeMismatch(ValueUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ValueUnion"))
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .integer(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        case .stringArray(let x):
//            try container.encode(x)
//        case .valueClass(let x):
//            try container.encode(x)
//        case .null:
//            try container.encodeNil()
//        }
//    }
//}
//
//extension ValueClass {
//    enum CodingKeys: String, CodingKey {
//        case url = "url"
//        case id = "id"
//        case type = "_type"
//        case contact = "contact"
//        case originalname = "originalname"
//        case comment = "comment"
//        case date = "date"
//        case username = "username"
//        case datatype = "datatype"
//        case dataurl = "dataurl"
//    }
//}
//
//extension Contact {
//    enum CodingKeys: String, CodingKey {
//        case url = "url"
//        case id = "id"
//        case name = "name"
//        case type = "_type"
//        case jobtitle = "jobtitle"
//        case organization = "organization"
//        case person = "person"
//    }
//}
//
//extension PurpleType {
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(String.self) {
//            switch x {
//            case "Attachment":
//                self = .attachment
//                return
//            case "Checkbox":
//                self = .checkbox
//                return
//            case "Contact":
//                self = .contact
//                return
//            case "Date":
//                self = .date
//                return
//            case "DateAndTime":
//                self = .dateAndTime
//                return
//            case "Dropdown":
//                self = .dropdown
//                return
//            case "Label":
//                self = .label
//                return
//            case "Labels":
//                self = .labels
//                return
//            case "Number":
//                self = .number
//                return
//            case "Publication Trigger":
//                self = .publicationTrigger
//                return
//            case "Remote info":
//                self = .remoteInfo
//                return
//            case "Resource":
//                self = .resource
//                return
//            case "String":
//                self = .string
//                return
//            case "Text":
//                self = .text
//                return
//            case "Y/N":
//                self = .yN
//                return
//            default:
//                break
//            }
//        }
//        throw DecodingError.typeMismatch(PurpleType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for PurpleType"))
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .attachment:
//            try container.encode("Attachment")
//        case .checkbox:
//            try container.encode("Checkbox")
//        case .contact:
//            try container.encode("Contact")
//        case .date:
//            try container.encode("Date")
//        case .dateAndTime:
//            try container.encode("DateAndTime")
//        case .dropdown:
//            try container.encode("Dropdown")
//        case .label:
//            try container.encode("Label")
//        case .labels:
//            try container.encode("Labels")
//        case .number:
//            try container.encode("Number")
//        case .publicationTrigger:
//            try container.encode("Publication Trigger")
//        case .remoteInfo:
//            try container.encode("Remote info")
//        case .resource:
//            try container.encode("Resource")
//        case .string:
//            try container.encode("String")
//        case .text:
//            try container.encode("Text")
//        case .yN:
//            try container.encode("Y/N")
//        }
//    }
//}
//
//extension Event {
//    enum CodingKeys: String, CodingKey {
//        case url = "url"
//        case id = "id"
//        case name = "name"
//        case type = "_type"
//    }
//}
//
//extension Definitions {
//    enum CodingKeys: String, CodingKey {
//        case url = "url"
//    }
//}
//
//
////// Helpers
////
////class JSONNull: Codable {
////    public init() {
////    }
////
////    public required init(from decoder: Decoder) throws {
////        let container = try decoder.singleValueContainer()
////        if !container.decodeNil() {
////            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
////        }
////    }
////
////    public func encode(to encoder: Encoder) throws {
////        var container = encoder.singleValueContainer()
////        try container.encodeNil()
////    }
////}
//
