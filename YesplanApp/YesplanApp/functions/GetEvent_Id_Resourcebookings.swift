//
//  GetEvent_Id_Resourcebookings.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 4/02/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

public func GetEvent_Id_Resourcebookings(objectURL: String) {
     objectArray = []
    var SectionArray = [(section: String, rows: Any)]()
//    print("resourcebookings")
//    print(GlobalVariable.URL)
//    print("\(GlobalVariable.URL)/resourcebookings?api_key=\(GlobalVariable.API_Key)")
    if let EventResourceBookings = eventResourceBookings.from(url: "\(GlobalVariable.URL)/resourcebookings?api_key=\(GlobalVariable.API_Key)") {
//    print(EventResourceBookings)
        for i in 0 ..< EventResourceBookings.count {
            //            print("i: ",i)
            if EventResourceBookings[i].type == "resourcebookinggroup" {
//                print(EventResourceBookings[i].type)
                
                EventResourceBookings[i].printResourcebooking_Id() //OK
                print(objectArray)
//                SectionArray.append(resourceList)
                
//                for j in 0 ..< EventResourceBookings[i].children!.count {
                    //                    print("j: ",j)
//                    resourceName = EventResourceBookings[i].children![j].resource.name
//                    //                    print(EventResourceBookings[i].children![j].resource.name)
//                    resourceStart = stringToTime(myDateString:EventResourceBookings[i].children![j].start ?? "no start specified")
//                    resourceEnd = stringToTime(myDateString:EventResourceBookings[i].children![j].end ?? "no end specified")
//                    resourceRole = EventResourceBookings[i].children![j].role ?? "no role"
//                    if EventResourceBookings[i].children![j].resource.resourcetype == "human" {
//                        resourcelisthuman.append("\(resourceName)\n\t \(resourceRole)\n\t \(resourceStart) - \(resourceEnd)" )
//                    }
//                    if EventResourceBookings[i].children![j].resource.resourcetype == "material" {
//                        resourcelistmaterial.append("\(resourceName)\n\t \(resourceRole)\n\t \(resourceStart) - \(resourceEnd)" )
//                    }
//                }
            } else {
//                print(EventResourceBookings[i].type)
               
                EventResourceBookings[i].printResourcebooking_Id() //OK
                print(objectArray)
//                EventResourceBookings[i].printResourcebooking_Id() //OK

//                //                print("x")
//                resourceName = EventResourceBookings[i].resource!.name
//                //                print(EventResourceBookings[i].resource!.name)
//                if EventResourceBookings[i].start != nil {
//                    resourceStart = stringToTime(myDateString:EventResourceBookings[i].start!)
//                }
//                if EventResourceBookings[i].end != nil {
//                    resourceEnd = stringToTime(myDateString:EventResourceBookings[i].end!)
//                }
//                resourceRole = EventResourceBookings[i].role ?? ""
//
//                if EventResourceBookings[i].resource?.resourcetype == "human" {
//                    resourcelisthuman.append("\(resourceName)\n\t \(resourceRole)\n\t \(resourceStart) - \(resourceEnd)" )
//                }
//                if EventResourceBookings[i].resource?.resourcetype == "material" {
//                    resourcelistmaterial.append("\(resourceName)\n\t \(resourceStart) - \(resourceEnd)" )
//                }
//                if EventResourceBookings[i].children?.count != nil {
//
//                    for k in 0 ..< EventResourceBookings[i].children!.count {
//                        //                        print("k: ",k)
//                        resourceName = EventResourceBookings[i].children![k].resource.name
//                        //                        print(EventResourceBookings[i].children![k].resource.name)
//                        if EventResourceBookings[i].children![k].start != nil {
//                            resourceStart = stringToTime(myDateString: EventResourceBookings[i].children![k].start!)
//                        }
//                        if EventResourceBookings[i].children![k].end != nil {
//                            resourceEnd = stringToTime(myDateString: EventResourceBookings[i].children![k].end!)
//                        }
//                        if EventResourceBookings[i].children![k].role != nil {
//                            resourceRole = EventResourceBookings[i].children![k].role!
//                        }
//                        if EventResourceBookings[i].children![k].resource.resourcetype == "set" {
//                            if EventResourceBookings[i].children![k].children?.count != nil {
//                                for l in 0 ..< EventResourceBookings[i].children![k].children!.count {
//                                    //                                    print("l: ",l)
//                                    //                                    print(EventResourceBookings[i].children![k].children![l].resource.name)
//                                    if EventResourceBookings[i].children![k].children![l].resource.resourcetype == "material" {
//                                        resourceName = EventResourceBookings[i].children![k].children![l].resource.name
//                                        if EventResourceBookings[i].children![k].children![l].start != nil {
//                                            resourceStart = stringToTime(myDateString: EventResourceBookings[i].children![k].children![l].start!)
//                                        }
//                                        if EventResourceBookings[i].children![k].children![l].end != nil {
//                                            resourceEnd = stringToTime(myDateString: EventResourceBookings[i].children![k].children![l].end!)
//                                        }
//                                        resourcelistmaterial.append("\(resourceName)" )
//                                    }
//                                    if EventResourceBookings[i].children![k].children![l].resource.resourcetype == "human"  {
//
//                                        resourceName = EventResourceBookings[i].children![k].children![l].children![0].resource.name
//                                        if EventResourceBookings[i].children![k].children![l].children![0].start != nil {
//                                            resourceStart = stringToTime(myDateString: EventResourceBookings[i].children![k].children![l].children![0].start!)
//                                        }
//                                        if EventResourceBookings[i].children![k].children![l].children![0].end != nil {
//                                            resourceEnd = stringToTime(myDateString: EventResourceBookings[i].children![k].children![l].children![0].end!)
//                                        }
//                                        if EventResourceBookings[i].children![k].children![l].children![0].role != nil {
//                                            resourceRole = EventResourceBookings[i].children![k].children![l].children![0].role!
//                                            //                                            print(EventResourceBookings[i].children![k].children![l].children![0].role!)
//                                        }
//                                        resourcelisthuman.append("\(resourceName)\n\t \(resourceRole)\n\t \(resourceStart) - \(resourceEnd)" )
//                                    }
//                                }
//                            }
//                        }
//
//                    }
//                }
            }
        }
       
        


    }
    print("****")
    print(SectionArray)
    print("****")
    let groupedSectionArray = Dictionary(grouping: SectionArray, by: { $0.section })
    print("groupedSectionArray: ", groupedSectionArray)
}
