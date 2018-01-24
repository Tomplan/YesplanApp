//
//  func stringToDateShort.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 24/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import Foundation

public func stringToDateShort(myDateString: String) -> String {
    
    let dateFormatter = DateFormatter()
    let tempLocale = dateFormatter.locale // save locale temporarily
    dateFormatter.locale = Locale(identifier: "nl_BE") // set locale to reliable US_POSIX
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let date = dateFormatter.date(from: myDateString)!
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let dateString = dateFormatter.string(from: date)
    dateFormatter.locale = tempLocale // reset the locale
    //                    print("EXACT_DATE : \(dateString)")
    return dateString
    
}
