//
//  func stringToEventDate.swift
//  TomPlanX
//
//  Created by Tom Slegers on 23/11/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

public func stringToSelectedDate(myDateString: String) -> String {
    
    let dateFormatter = DateFormatter()
    let tempLocale = dateFormatter.locale // save locale temporarily
    dateFormatter.locale = Locale(identifier: "nl_BE") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "dd-MM-yyyy"
    let date = dateFormatter.date(from: myDateString)!
    dateFormatter.dateFormat = "dd-MM-yyyy"
    let dateString = dateFormatter.string(from: date)
    dateFormatter.locale = tempLocale // reset the locale
    //                    print("EXACT_DATE : \(dateString)")
    return dateString
    
}
