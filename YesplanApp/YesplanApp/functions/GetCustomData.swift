//
//  GetCustomData.swift
//  YesplanApp
//
//  Created by Tom Slegers on 19/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

var CustomDataList = [String]()
//var myvalueList = [PurpleValue]

func GetCustomData(objectID: String) {
    
    print("objectId: ", objectID)
//    let EventCustomData = Welcome.from(url: "https://dewerft.yesplan.be/api/event/\(objectID)/customdata?api_key=6AED6266671C92209161289C37D109E0")!
    let EventCustomData = Customdata(url: "https://dewerft.yesplan.be/api/event/\(objectID)/customdata?api_key=6AED6266671C92209161289C37D109E0")
    if EventCustomData != nil {
    //                print("EventCustomData:  \n \(EventCustomData)")
//                    dump(EventCustomData)
        let EventCustomData = EventCustomData!
//    dump(EventCustomData.event)
//    print("CustomDataList: " ,CustomDataList)
                    CustomDataList.append("**** \(EventCustomData.event.name) ****")
//        print("groups: ", EventCustomData.groups!)
                    for a in 0 ..< EventCustomData.groups!.count {
                        print("ok a")
                        CustomDataList.append("*** \(EventCustomData.groups![a].name) ***")
                        print(EventCustomData.groups![a].children.count)
                            if EventCustomData.groups![a].children.isEmpty != true {

    //                        print("FIRST")
                                for b in 0 ..< EventCustomData.groups![a].children.count {
                                    print("ok b")
                                CustomDataList.append(" \t \(EventCustomData.groups![a].children[b].name)")
//                              print(EventCustomData.groups![a].children![b])
                                    if EventCustomData.groups![a].children[b].children?.isEmpty != true {
                                
                                        if EventCustomData.groups![a].children[b].children != nil {
                                for c in 0 ..< EventCustomData.groups![a].children[b].children!.count {
                                    print("ok c")
//                                    print(EventCustomData.groups![a].children[b].children![c].value)

                                CustomDataList.append(" \t\t \(EventCustomData.groups![a].children[b].children![c].name)")



                                            if EventCustomData.groups![a].children[b].children![c].value != nil {
                                            print(EventCustomData.groups![a].children[b].children![c].value)



                                                var myValue = EventCustomData.groups![a].children[b].children![c].value

                                                switch myValue {
                                                case .integer(let model):
                                                    print("INTEGER")
                                            CustomDataList.append(" \t\t\t \(model)")                                          case .string(let model):
                                                        print("STRING")
                                                    CustomDataList.append(" \t\t\t \(model)")
                                                case .anythingArray(let model):
                                                    print("anythingArray")
//                                                    CustomDataList.append(" \t\t\t \(model)")
                                                case .valueClass(let model):
                                                    print("VALUECLASS")
//                                                    dump(model)
                                                    CustomDataList.append(" \t\t\t \(model)")


                                                default:
                                                    print("no case detected")
                                                }



                                    }
//                                    dump(" \(EventCustomData.groups![a].children![b].children![c].value!)")
                                }
                                    }
                                }
                            }
                        }

                    }
}
}
