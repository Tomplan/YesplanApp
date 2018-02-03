//
//  GetTask.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 1/02/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

//var taskSection: [String] = []
//var taskList: [String : String] = [:]

public func GetTask(objectID: String) {
    
    objectArray = []

    let task_json = "\(GlobalVariable.URL)?api_key=\(GlobalVariable.API_Key)"
    
    if let task = Task_Id(url: task_json) {
       task.printTask_Id()
        
    }
}


////
//
//
//        for (key, value) in mirror.children {
//
//            switch value {
//
//            case is String:
////                print("String: \(key!): \(value)")
//                if key != "url" && key != "id" {
//                    objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [value as! String])) }
//                case is Int:
//    //                print("Int: \(key!): \(value)")
//                    objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [String(describing: value)]))
//                case is Double:
//    //                print("Double: \(key!): \(value)")
//                    objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [String(describing: value)]))
////            case .nil:
////                print("nothing")
//            default:
////                    print("default: \(key!): \(value)")
//                if key == "owner" {
//                    print("owner")
//
//                }
//                if key == "owningteam" {
//                    print("owningteam")
//                }
//                if key == "owninggroup" {
//                    print("owninggroup")
//                }
//            }
//        }
//    }
//}
//
////                    objectArray.append(TableViewObjects(sectionName: key, sectionObjects: ["more..."]))
//////                    print(value)
////                mirror = Mirror(reflecting: value)
////
////                for (key, value) in mirror.children {
////                    //
////                    switch value {
////                    case is String:
////                        //                print("String: \(key!): \(value)")
////                        if key != "url" && key != "id" {
////                            taskArray.append(TableViewObjects(sectionName: key, sectionObjects: [value as! String])) }
////                    case is Int:
////                        //                print("Int: \(key!): \(value)")
////                        taskArray.append(TableViewObjects(sectionName: key, sectionObjects: [String(describing: value)]))
////                    case is Double:
////                        //                print("Double: \(key!): \(value)")
////                        taskArray.append(TableViewObjects(sectionName: key, sectionObjects: [String(describing: value)]))
////                        //            case .nil:
////                    //                print("nothing")
////                    default:
////                                            print("default: \(key!): \(value)")
////
//////                        taskArray.append(TableViewObjects(sectionName: key, sectionObjects: [value]))
////                        //                    print(value)
////                    }
////                }
//
////
////                for (key2, value) in mirror.children {
////                    //
////                    switch value {
////                    case is String:
////                        print("String: \(key2!): \(value)")
//////                        objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [value as! String]))
////                    case is Int:
////                        print("Int: \(key2!): \(value)")
//////                        objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [String(describing: value)]))
////                    case is Double:
////                        print("Double: \(key2!): \(value)")
//////                        objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [String(describing: value)]))
////
////                    default:
////                        print("subvalue2")
////                        print("default: \(key2!): \(value)")//                        if value != nil {
//////                            objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [value as! String]))
//////                        }
////                        mirror = Mirror(reflecting: value)
////
////                        for (key2, value) in mirror.children {
////                            //
////                            switch value {
////                            case is String:
////                                print("String: \(key!): \(value)")
//////                                                    objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [value as! String]))
////                            case is Int:
////                                print("Int: \(key!): \(value)")
////                            //                        objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [String(describing: value)]))
////                            case is Double:
////                                print("Double: \(key!): \(value)")
////                            //                        objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [String(describing: value)]))
////                            default:
////                                print("subvalue3")
////
////                                mirror = Mirror(reflecting: value)
////
////                                for (key, value) in mirror.children {
////                                    //
////                                    switch value {
////                                    case is String:
////                                        print("String: \(key!): \(value)")
////
////                                    //                        objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [value as! String]))
////                                    case is Int:
////                                        print("Int: \(key!): \(value)")
////                                    //                        objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [String(describing: value)]))
////                                    case is Double:
////                                        print("Double: \(key!): \(value)")
////                                    //                        objectArray.append(TableViewObjects(sectionName: key, sectionObjects: [String(describing: value)]))
////                                    default:
////                                        print("subvalue4")
////                                    }
////                                }
////                            }
////                        }
////                    }
////                }
////            }
////        }
////    }
////}

