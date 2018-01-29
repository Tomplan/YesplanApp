//
//  DVCEventTimeSchedulesViewController.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 29/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import UIKit

class DVCEventTimeSchedules: UIViewController {

    var contentText: String?
    var contentLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        self.title = "Schedules"
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        
        if self.contentText != nil {
            self.contentLabel?.text = self.contentText
        }
    }
    
    
    func initializeInterfaceElements() {
        self.contentLabel = UILabel()
        self.contentLabel!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.contentLabel!)
    }
    
    
    func autolayoutInterfaceElements() {
        self.contentLabel!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.contentLabel!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
}

