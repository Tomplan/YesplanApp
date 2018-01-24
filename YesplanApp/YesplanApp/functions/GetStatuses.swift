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
    let statuses = Statuses.from(url: "https://dewerft.yesplan.be/api/statuses?api_key=6AED6266671C92209161289C37D109E0")!
    //    dump(profiles)
    //    print(profiles.data.count)
    for i in 0 ..< statuses.data.count {
                print(statuses.data[i].name!)
                print(statuses.data[i].backgroundcolor!)
        statusDict[statuses.data[i].name!] = statuses.data[i].backgroundcolor!
    }
//        print(statusDict)
}
