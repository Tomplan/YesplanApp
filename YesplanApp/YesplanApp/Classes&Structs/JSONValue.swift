////
////  JSONValue.swift
////  YesplanApp
////
////  Created by Techcc - FOH - Video on 3/02/18.
////  Copyright © 2018 TomPlan. All rights reserved.
////
//
//import Foundation
//
//import UIKit
////import XCTest
//
//// Requires a recent Swift 4 snapshot toolchain (Xcode 9 beta 2 not new enough)
//
//public indirect enum JSONValue: Codable {
//    case double(Double)
//    case string(String)
//    case bool(Bool)
//    case dictionary([String: JSONValue])
//    case array([JSONValue])
//    case `nil`
//    
//    public init(from decoder: Decoder) throws {
//        let singleValueContainer = try decoder.singleValueContainer()
//        if let value = try? singleValueContainer.decode(Bool.self) {
//            self = .bool(value)
//            return
//        } else if let value = try? singleValueContainer.decode(String.self) {
//            self = .string(value)
//            return
//        } else if let value = try? singleValueContainer.decode(Double.self) {
//            self = .double(value)
//            return
//        } else if let value = try? singleValueContainer.decode([String: JSONValue].self) {
//            self = .dictionary(value)
//            return
//        } else if let value = try? singleValueContainer.decode([JSONValue].self) {
//            self = .array(value)
//            return
//        } else if singleValueContainer.decodeNil() {
//            self = .nil
//            return
//        }
//        throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Could not find reasonable type to map to JSONValue"))
//    }
//    
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//            //        case .integer(let x):
//            //            try container.encode(x)
//        case .array(let x):
//            try container.encode(x)
//        case .bool(let x):
//            try container.encode(x)
//        case .double(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        case .dictionary(let x):
//            try container.encode(x)
//        case .`nil`:
//            try container.encodeNil()
//        }
//    }
//}
//
//// MARK: - Convenience
//
//extension JSONValue {
//    public var string: String? {
//        switch self {
//        case .string(let value):
//            return value
//        default:
//            return nil
//        }
//    }
//    public var double: Double? {
//        switch self {
//        case .double(let value):
//            return value
//        default:
//            return nil
//        }
//    }
//    public var bool: Bool? {
//        switch self {
//        case .bool(let value):
//            return value
//        default:
//            return nil
//        }
//    }
//    public var dictionary: [String: JSONValue]? {
//        switch self {
//        case .dictionary(let value):
//            return value
//        default:
//            return nil
//        }
//    }
//    public var array: [JSONValue]? {
//        switch self {
//        case .array(let value):
//            return value
//        default:
//            return nil
//        }
//    }
//    public var isNil: Bool {
//        switch self {
//        case .nil:
//            return true
//        default:
//            return false
//        }
//    }
//}
//
////class JSONValueTests: XCTestCase {
////
////    func testDecoding() {
////        let decoder = JSONDecoder()
////        let a = try! decoder.decode(JSONValue.self, from: """
////            {
////                "storage": {
////                    "subthing": "stringValue",
////                    "a": 2,
////                    "bool": true,
////                    "nilValue": null,
////                },
////                "nilValue": null
////            }
////        """.data(using: .utf8)!)
////        XCTAssertEqual(a.dictionary?["storage"]?.dictionary?["subthing"]?.string, "stringValue")
////        XCTAssertEqual(a.dictionary?["storage"]?.dictionary?["a"]?.double, 2.0)
////        XCTAssertEqual(a.dictionary?["storage"]?.dictionary?["bool"]?.bool, true)
////        XCTAssertEqual(a.dictionary?["storage"]?.dictionary?["nilValue"]?.isNil, true)
////    }
////}
//
