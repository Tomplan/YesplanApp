//
//  TVCTasks.swift
//  YesplanApp
//
//  Created by Tom Slegers on 23/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import UIKit

class TVCTasks: UITableViewCell {

    var LabelTasksName = UILabel()
    var LabelTasksDue = UILabel()
    var LabelTasksStart = UILabel()

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        //fatalError("init(coder:) has not been implemented")
    }
    
    func initializeInterfaceElements() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 4
        self.layer.shadowOffset = CGSize(width: -2, height: 2)
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = UIColor.lightGray
        
        
        self.LabelTasksName.translatesAutoresizingMaskIntoConstraints = false
        self.LabelTasksName.numberOfLines = 0
        self.LabelTasksName.font = UIFont.systemFont(ofSize: 15.0)
        self.LabelTasksName.textColor = UIColor.red
        self.contentView.addSubview(self.LabelTasksName)
        
        self.LabelTasksDue.translatesAutoresizingMaskIntoConstraints = false
        self.LabelTasksDue.numberOfLines = 0
        self.LabelTasksDue.font = UIFont.systemFont(ofSize: 12.0)
        self.LabelTasksDue.textColor = UIColor.gray
        self.contentView.addSubview(self.LabelTasksDue)
        
        self.LabelTasksStart.translatesAutoresizingMaskIntoConstraints = false
        self.LabelTasksStart.numberOfLines = 0
        self.LabelTasksStart.font = UIFont.systemFont(ofSize: 12.0)
        self.LabelTasksStart.textColor = UIColor.gray
        self.contentView.addSubview(self.LabelTasksStart)
        
    }
    
    
    func autolayoutInterfaceElements() {

        self.LabelTasksName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 3.0).isActive = true
        self.LabelTasksName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
        self.LabelTasksName.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
         self.LabelTasksName.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -5.0).isActive = true
        
        self.LabelTasksDue.topAnchor.constraint(equalTo: self.LabelTasksName.bottomAnchor, constant: 1.0).isActive = true
        self.LabelTasksDue.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
        self.LabelTasksDue.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
        self.LabelTasksDue.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -5.0).isActive = true
        
        self.LabelTasksStart.topAnchor.constraint(equalTo: self.LabelTasksDue.bottomAnchor, constant: 1.0).isActive = true
        self.LabelTasksStart.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
        self.LabelTasksStart.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
        self.LabelTasksStart.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -5.0).isActive = true
    }
    
    override func prepareForReuse() {
        self.LabelTasksName.text = ""
        self.LabelTasksDue.text = ""
        self.LabelTasksStart.text = ""

    }
    
}

