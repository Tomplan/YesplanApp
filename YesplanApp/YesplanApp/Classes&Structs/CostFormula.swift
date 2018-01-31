//
//  CostFormula.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//
//
//import Foundation
//
//struct Formula: Codable {
//    let amount: Double
//    let per: String?
//    let includesvat: Bool
//    let from: String?   // time
//    let to: String?     // time
//    let dayparts: JSONAny?
//    
//    enum CodingKeys: String, CodingKey {
//        case amount = "amount"
//        case per = "per"
//        case includesvat = "includesvat"
//        case from = "from"
//        case to = "to"
//        case dayparts = "dayparts"
//    }
//    
//    func printFormula() {
//        print("\t formula: ")
//        print("\t\t amount: \(amount)")
//        if let per = self.per { print("\t\t per: \(per)") }
//        print("\t\t includesvat: \(includesvat)")
//        if let from = self.from { print("\t\t from: \(from)") }
//        if let to = self.to { print("\t\t to: \(to)") }
//        if let dayparts = self.dayparts { print("\t\t dayparts: \(dayparts)") }
//    }
//}

