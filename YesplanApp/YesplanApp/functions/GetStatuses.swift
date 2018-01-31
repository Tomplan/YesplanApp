//
//  GetStatuses.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

var statusDict: [String:String] = [:]

public func GetStatuses() {
    let statuses = Statuses(url: "\(GlobalVariable.OrganizationURL)/api/statuses?api_key=\(GlobalVariable.API_Key)")!
    //    dump(profiles)
    //    print(profiles.data.count)
    for i in 0 ..< statuses.data.count {
//                print(statuses.data[i].name!)
//                print(statuses.data[i].backgroundcolor!)
        statusDict[statuses.data[i].name] = statuses.data[i].backgroundcolor
    }
//        print(statusDict)
}
