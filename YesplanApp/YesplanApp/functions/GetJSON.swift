//
//  GetJSON.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 3/02/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

public func GetJSON(objectID: String) {
    GlobalVariable.ObjectType = "user"
    GlobalVariable.ObjectId = "776035841-1478520961"
    print("getJSON")
    print(GlobalVariable.OrganizationURL)
    print(GlobalVariable.ObjectType)
    print(GlobalVariable.ObjectId)
    print(GlobalVariable.API_Key)



    
    objectArray = []
    
    let json = "\(GlobalVariable.OrganizationURL)/api/\(GlobalVariable.ObjectType)/\(GlobalVariable.ObjectId)?api_key=\(GlobalVariable.API_Key)"
    
    if let jsonData = User_Id(url: json) {
        print("jsonData found")
        
        
        print(jsonData)
        
        var mirror = Mirror(reflecting: jsonData)
        //
        
        
        for (key, value) in mirror.children {
            //
            switch value {
            case is String:
                print("String: \(key!): \(value)")
//                if key != "url" && key != "id" {
//                    objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [value as! String])) }
            case is Int:
                print("Int: \(key!): \(value)")
//                objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [String(describing: value)]))
            case is Double:
                print("Double: \(key!): \(value)")
//                objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [String(describing: value)]))
            default:
                print("default: \(key!): \(value)")
//                objectArray.append(TableViewObjects(sectionName: key, sectionObjects: ["more..."]))
//
            }
        }
    }
}
