//
//  DVCEventLocation.swift
//  YesplanApp
//
//  Created by Tom Slegers on 19/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import UIKit

class DVCEventLocation: UIViewController {

    var contentText: String?
    var contentLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        self.title = "Location"
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

