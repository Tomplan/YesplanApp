//
//  SwitchValue.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 4/02/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

public func SwitchValue(value: Any) {
    switch value {
    case is String:
        print("String: \(value)")
        SwitchValueList.append(value as! String)
    case is Double:
        print("Double: \(value)")
        SwitchValueList.append(value as! String)
    case is Bool:
        print("Bool: \(value)")
        SwitchValueList.append(value as! String)
    case is NSDictionary: // [String: Any]:
//        print("dictionary")
        for (key, value2) in (value as? [String: Any])! {
            print("\(key): \(value2)")
            SwitchValue(value: value2)
        }
    case is NSArray: // [String: Any]:
        print("array: \(value)" )
        
//        for value3 in (value as? [String])! {
//            SwitchValue(value: value3)
//        }
        
    default:
        print("default: \(value)")
    }
}
//public func SwitchValue2(value: Any) {
//    switch value {
//    case is String:
//        print("String")
//    case is Double:
//        print("Double")
//    case is Bool:
//        print("Bool")
//    case is NSDictionary: // [String: Any]:
//        print("dictionary")
//        for (key, value2) in (value as? [String: Any])! {
//            print("\(key): \(value)")
//            SwitchValue2(value: value)
//        }
//    case is NSArray: // [String: Any]:
//        print("array")
//    default:
//        print("default")
//    }
//}

