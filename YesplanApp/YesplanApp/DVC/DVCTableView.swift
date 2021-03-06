//
//  DVCTableView.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 3/02/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import UIKit
import Foundation

var identifier: String = ""

class DVCTableView: UIViewController {
    
    var tableView: UITableView = UITableView()
    //    var scheduleList = [String]()
    //    var eventName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray
        self.tableView.backgroundColor = UIColor.darkGray
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
    }
    
    
    func initializeInterfaceElements() {
//        GetTask(objectID: GlobalVariable.ObjectId)
//        GetJSON(objectID: GlobalVariable.ObjectId)
//        GlobalVariable.ObjectType = "user"
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.view.addSubview(self.tableView)
    }
    
    
    func autolayoutInterfaceElements() {
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}


extension DVCTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor? = UIColor.darkGray
        cell.textLabel?.textColor = UIColor.lightGray
        tableView.separatorStyle = .none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // objectArray.count // taskSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //            identifier = taskSection[section]
//        identifier = objectArray[section].sectionName
        //            print(identifier)
        return "identifier" // taskSection[section]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // objectArray[section].sectionObjects.count// taskSection[section].
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "defaultCell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "defaultCell")
        }
        //            print(taskList[identifier]!)
        
        cell!.textLabel?.text = "cell" // objectArray[indexPath.section].sectionObjects[indexPath.row]
        cell!.textLabel?.numberOfLines = 0
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}
