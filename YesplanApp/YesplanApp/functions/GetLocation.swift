//
//  GetLocation.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 31/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation


var locationList = [String]()

func GetLocation(objectID: String) {
    
    locationList = []
    if let event = Event_Id(url: "\(GlobalVariable.OrganizationURL)/api/event/\(objectID)?api_key=\(GlobalVariable.API_Key)") {
         let locations = event.locations
        for i in 0 ..< locations.count {
            if let MYlocation = locations[i].name {
            locationList.append(MYlocation)
            }
        }
    }
}
