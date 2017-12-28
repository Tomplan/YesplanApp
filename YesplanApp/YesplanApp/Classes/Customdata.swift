////
////  Customdata.swift
////  YesplanApp
////
////  Created by Tom Slegers on 17/12/17.
////  Copyright © 2017 TomPlan. All rights reserved.
////
// To parse the JSON, add this file to your project and do:
//
//   let customdata = Customdata(json)!

import Foundation

struct Customdata: Codable {
    let event: Event
    let definitions: Customdata_ID
    let groups: [Custom_Data_Group]?
    
    enum CodingKeys: String, CodingKey {
        case event = "event"
        case definitions = "definitions"
        case groups = "groups"
    }
}

struct Custom_Data_Group: Codable {
    let name: String
    let keyword: String
    let children: [Custom_Data_Element]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case keyword = "keyword"
        case children = "children"
    }
}

struct Custom_Data_Element: Codable {
    let name: String
    let keyword: String
    let children: [Custom_Data_Child]?
    let type: String?
    let value: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case keyword = "keyword"
        case children = "children"
        case type = "type"
        case value = "value"
    }
}

struct Custom_Data_Child: Codable {
    let name: String
    let keyword: String
    let type: Custom_Data_Type
    let value: Custom_Data_Value
    let options: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case keyword = "keyword"
        case type = "type"
        case value = "value"
        case options = "options"
    }
}

enum Custom_Data_Value: Codable {
    case anythingArray([JSONAny])
    case integer(Int)
    case string(String)
    case custom_Data_attachment(Custom_Data_Attachment)
    case null
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
//            print("Int")
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
//            print("String")
            return
        }
        if let x = try? container.decode(Custom_Data_Attachment.self) {
            self = .custom_Data_attachment(x)
//            print("custom_Data_attachment")
            return
        }
        if let x = try? container.decode([JSONAny].self) {
            self = .anythingArray(x)
//            print("anythingArray")
            return
        }
        if container.decodeNil() {
            self = .null
            return
        }
        throw DecodingError.typeMismatch(Custom_Data_Value.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ValueUnion"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .anythingArray(let x):
            try container.encode(x)
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        case .custom_Data_attachment(let x):
            try container.encode(x)
        case .null:
            try container.encodeNil()
        }
    }
}

struct Custom_Data_Attachment: Codable {
    let url: String?
    let id: String?
    let type: String?
    let contact: CustomdataContact?
    let originalname: String?
    let comment: JSONNull?
    let date: String?
    let username: String?
    let datatype: String?
    let dataurl: String?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case type = "_type"
        case contact = "contact"
        case originalname = "originalname"
        case comment = "comment"
        case date = "date"
        case username = "username"
        case datatype = "datatype"
        case dataurl = "dataurl"
    }
}

struct CustomdataContact: Codable {
    let url: String
    let id: String
    let name: String?
    let type: String
    let jobtitle: String?
    let organization: Event?
    let person: Event?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case id = "id"
        case name = "name"
        case type = "_type"
        case jobtitle = "jobtitle"
        case organization = "organization"
        case person = "person"
    }
}

enum Custom_Data_Type: String, Codable {
    case attachment = "Attachment"
    case checkbox = "Checkbox"
    case contact = "Contact"
    case date = "Date"
    case dateAndTime = "DateAndTime"
    case dropdown = "Dropdown"
    case label = "Label"
    case labels = "Labels"
    case number = "Number"
    case publicationTrigger = "Publication Trigger"
    case remoteInfo = "Remote info"
    case resource = "Resource"
    case string = "String"
    case text = "Text"
    case yN = "Y/N"
}
//
//struct CustomdataEvent: Codable {
//    let url: String
//    let id: String
//    let name: String
//    let type: String
//
//    enum CodingKeys: String, CodingKey {
//        case url = "url"
//        case id = "id"
//        case name = "name"
//        case type = "_type"
//    }
//}

struct Customdata_ID: Codable {
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
    }
}

// MARK: Convenience initializers

extension Customdata {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Customdata.self, from: data) else { return nil }
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
//
//extension CustomdataGroup {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(CustomdataGroup.self, from: data) else { return nil }
//        self = me
//    }
//
//    init?(_ json: String, using encoding: String.Encoding = .utf8) {
//        guard let data = json.data(using: encoding) else { return nil }
//        self.init(data: data)
//    }
//
//    init?(url: String) {
//        guard let url = URL(string: url) else { return nil }
//        guard let data = try? Data(contentsOf: url) else { return nil }
//        self.init(data: data)
//    }
//
//    var jsonData: Data? {
//        return try? JSONEncoder().encode(self)
//    }
//
//    var json: String? {
//        guard let data = self.jsonData else { return nil }
//        return String(data: data, encoding: .utf8)
//    }
//}
//
extension Custom_Data_Element {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Custom_Data_Element.self, from: data) else { return nil }
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
//
//extension ChildChild {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(ChildChild.self, from: data) else { return nil }
//        self = me
//    }
//
//    init?(_ json: String, using encoding: String.Encoding = .utf8) {
//        guard let data = json.data(using: encoding) else { return nil }
//        self.init(data: data)
//    }
//
//    init?(url: String) {
//        guard let url = URL(string: url) else { return nil }
//        guard let data = try? Data(contentsOf: url) else { return nil }
//        self.init(data: data)
//    }
//
//    var jsonData: Data? {
//        return try? JSONEncoder().encode(self)
//    }
//
//    var json: String? {
//        guard let data = self.jsonData else { return nil }
//        return String(data: data, encoding: .utf8)
//    }
//}

extension Custom_Data_Attachment {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Custom_Data_Attachment.self, from: data) else { return nil }
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

extension CustomdataContact {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(CustomdataContact.self, from: data) else { return nil }
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
//
//extension CustomdataEvent {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(CustomdataEvent.self, from: data) else { return nil }
//        self = me
//    }
//
//    init?(_ json: String, using encoding: String.Encoding = .utf8) {
//        guard let data = json.data(using: encoding) else { return nil }
//        self.init(data: data)
//    }
//
//    init?(url: String) {
//        guard let url = URL(string: url) else { return nil }
//        guard let data = try? Data(contentsOf: url) else { return nil }
//        self.init(data: data)
//    }
//
//    var jsonData: Data? {
//        return try? JSONEncoder().encode(self)
//    }
//
//    var json: String? {
//        guard let data = self.jsonData else { return nil }
//        return String(data: data, encoding: .utf8)
//    }
//}
//
//extension Definitions {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(Definitions.self, from: data) else { return nil }
//        self = me
//    }
//
//    init?(_ json: String, using encoding: String.Encoding = .utf8) {
//        guard let data = json.data(using: encoding) else { return nil }
//        self.init(data: data)
//    }
//
//    init?(url: String) {
//        guard let url = URL(string: url) else { return nil }
//        guard let data = try? Data(contentsOf: url) else { return nil }
//        self.init(data: data)
//    }
//
//    var jsonData: Data? {
//        return try? JSONEncoder().encode(self)
//    }
//
//    var json: String? {
//        guard let data = self.jsonData else { return nil }
//        return String(data: data, encoding: .utf8)
//    }
//}


//import Foundation
//
//struct Welcome: Codable {
//    let event: CustomDataEvent?
//    let definitions: Definitions?
//    let groups: [Customs]?
//}
//
//struct Customs: Codable {
//    let name: String?
//    let keyword: String?
//    let children: [CustomDataChild]?
//}
//
//struct CustomDataChild: Codable {
//    let name: String?
//    let keyword: String?
//    let children: [CustomDataChild]?
//    let type: String?
//    let value: PurpleValue?
//    let options: [String]?
//}
//
//enum PurpleValue: Codable {
//    case null
//    case string(String)
//    case integer(Int)
//    case unionArray([FluffyValue])
//    case valueClass(ValueClass)
//
//}
//
//struct ValueClass: Codable {
//    let url: String
//    let id: String
//    let type: String
//    let contact: Contact?
//    let originalname: String?
//    let comment: JSONNull?
//    let date: String?
//    let username: String?
//    let datatype: String?
//    let dataurl: String?
//}
//
////
////struct Contact: Codable {
////    let url: String
////    let id: String
////    let type: String
////    let jobtitle: String?
////    let organization: Event?
////    let person: Event?
////    let name: String?
////}
//
//enum FluffyValue: Codable {
//    case event(CustomDataEvent)
//    case string(String)
//}
//
//struct CustomDataEvent: Codable {
//    let url: String
//    let id: String
//    let type: String
//    let resource: Resource?
//    let name: String?
//}
//
////
////struct Resource: Codable {
////    let url: String
////    let id: String
////    let resourcetype: String
////    let name: String
////    let group: String
////    let roles: [String]
////    let type: String
////}
//
//struct Definitions: Codable {
//    let url: String?
//}
//
//// MARK: Top-level extensions -
//
//extension Welcome {
//    static func from(json: String, using encoding: String.Encoding = .utf8) -> Welcome? {
//        guard let data = json.data(using: encoding) else { return nil }
//        return from(data: data)
//    }
//
//    static func from(data: Data) -> Welcome? {
//        let decoder = JSONDecoder()
//        return try? decoder.decode(Welcome.self, from: data)
//    }
//
//    static func from(url urlString: String) -> Welcome? {
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
//extension Welcome {
//    enum CodingKeys: String, CodingKey {
//        case event = "event"
//        case definitions = "definitions"
//        case groups = "groups"
//    }
//}
//
//extension Customs {
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case keyword = "keyword"
//        case children = "children"
//    }
//}
//
//extension CustomDataChild {
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//        case keyword = "keyword"
//        case children = "children"
//        case type = "type"
//        case value = "value"
//        case options = "options"
//    }
//}
//
//extension PurpleValue {
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
//        if let x = try? container.decode([FluffyValue].self) {
//            self = .unionArray(x)
//
//            return
//        }
//        if container.decodeNil() {
//            self = .null
//            return
//        }
//        throw DecodingError.typeMismatch(PurpleValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for PurpleValue"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .integer(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        case .unionArray(let x):
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
////
////extension Contact {
////    enum CodingKeys: String, CodingKey {
////        case url = "url"
////        case id = "id"
////        case type = "_type"
////        case jobtitle = "jobtitle"
////        case organization = "organization"
////        case person = "person"
////        case name = "name"
////    }
////}
//
//extension FluffyValue {
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
////            print("string")
////            print("self: ", self)
//            return
//        }
//        if let x = try? container.decode(CustomDataEvent.self) {
//            self = .event(x)
////            print("event")
////            print("self: ", x)
//
//            return
//        }
//        throw DecodingError.typeMismatch(FluffyValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for FluffyValue"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .event(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        }
//    }
//}
//
//extension CustomDataEvent {
//    enum CodingKeys: String, CodingKey {
//        case url = "url"
//        case id = "id"
//        case type = "_type"
//        case resource = "resource"
//        case name = "name"
//    }
//}
////
////extension Resource {
////    enum CodingKeys: String, CodingKey {
////        case url = "url"
////        case id = "id"
////        case resourcetype = "resourcetype"
////        case name = "name"
////        case group = "group"
////        case roles = "roles"
////        case type = "_type"
////    }
////}
//
//extension Definitions {
//    enum CodingKeys: String, CodingKey {
//        case url = "url"
//    }
//}
//
//// Helpers
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
