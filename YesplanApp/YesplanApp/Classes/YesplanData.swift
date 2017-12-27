////
////  YesplanData.swift
////  YesplanApp
////
////  Created by Tom Slegers on 27/12/17.
////  Copyright © 2017 TomPlan. All rights reserved.
////
//
//// To parse the JSON, add this file to your project and do:
////
////   let yesplan = Yesplan(json)!
//
//import Foundation
//
//struct Yesplan: Codable {
//    let models: Models
//    let resourcePath: String
//    let basePath: String
//    let swaggerVersion: String
//    let apiVersion: String
//    let apis: [API]
//    
//    enum CodingKeys: String, CodingKey {
//        case models = "models"
//        case resourcePath = "resourcePath"
//        case basePath = "basePath"
//        case swaggerVersion = "swaggerVersion"
//        case apiVersion = "apiVersion"
//        case apis = "apis"
//    }
//}
//
//struct Models: Codable {
//}
//
//struct API: Codable {
//    let operations: [Operation]
//    let path: String
//    let description: APIDescription
//    
//    enum CodingKeys: String, CodingKey {
//        case operations = "operations"
//        case path = "path"
//        case description = "description"
//    }
//}
//
//struct Operation: Codable {
//    let httpMethod: HTTPMethod
//    let errorResponses: [ErrorResponse]
//    let responseClass: ResponseClass
//    let nickname: String
//    let notes: String?
//    let parameters: [Parameter]
//    
//    enum CodingKeys: String, CodingKey {
//        case httpMethod = "httpMethod"
//        case errorResponses = "errorResponses"
//        case responseClass = "responseClass"
//        case nickname = "nickname"
//        case notes = "notes"
//        case parameters = "parameters"
//    }
//}
//
//enum ResponseClass: String, Codable {
//    case void = "void"
//}
//
//struct Parameter: Codable {
//    let allowMultiple: Bool
//    let name: Name
//    let dataType: DataType
//    let description: ParameterDescription?
//    let paramType: ParamType
//    
//    enum CodingKeys: String, CodingKey {
//        case allowMultiple = "allowMultiple"
//        case name = "name"
//        case dataType = "dataType"
//        case description = "description"
//        case paramType = "paramType"
//    }
//}
//
//enum ParamType: String, Codable {
//    case body = "body"
//    case path = "path"
//    case query = "query"
//}
//
//enum Name: String, Codable {
//    case id = "id"
//    case input = "input"
//    case keywords = "keywords"
//}
//
//enum ParameterDescription: String, Codable {
//    case purple = ""
//    case theID = "The id"
//}
//
//enum DataType: String, Codable {
//    case string = "string"
//}
//
//enum HTTPMethod: String, Codable {
//    case purpleGET = "GET"
//    case put = "PUT"
//}
//
//struct ErrorResponse: Codable {
//    let reason: Reason
//    let code: Int
//    
//    enum CodingKeys: String, CodingKey {
//        case reason = "reason"
//        case code = "code"
//    }
//}
//
//enum Reason: String, Codable {
//    case noOrInvalidAPIKeyProvided = "No, or invalid, API key provided"
//}
//
//enum APIDescription: String, Codable {
//    case empty = "???"
//}
//
//// MARK: Convenience initializers
//
//extension Yesplan {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(Yesplan.self, from: data) else { return nil }
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
//extension Models {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(Models.self, from: data) else { return nil }
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
//extension API {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(API.self, from: data) else { return nil }
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
//extension Operation {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(Operation.self, from: data) else { return nil }
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
//extension Parameter {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(Parameter.self, from: data) else { return nil }
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
//extension ErrorResponse {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(ErrorResponse.self, from: data) else { return nil }
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
