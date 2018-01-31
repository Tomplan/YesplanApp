//
//  GetProfiles.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

var profileDict: [String:String] = [:]

public func GetProfiles() {
    let profiles = Profiles(url: "\(GlobalVariable.OrganizationURL)/api/profiles?api_key=\(GlobalVariable.API_Key)")!
//    dump(profiles)
//    print(profiles.data.count)
    for i in 0 ..< profiles.data.count {
//        print(profiles.data[i].id)
//        print(profiles.data[i].color!)
        profileDict[profiles.data[i].id] = profiles.data[i].color
    }
//    print(profileDict)
}
