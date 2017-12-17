//
//  GetCurrentDate.swift
//  YesplanApp
//
//  Created by Tom Slegers on 12/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation

var selectedDateString = ""
var selectedEndDateString = ""

func GetCurrentDate() {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MM-yyyy"
    selectedDateString = formatter.string(from:Date())
    let selectedEndDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 10, to: Date())
    selectedEndDateString = formatter.string(from:selectedEndDate!)
    
}
