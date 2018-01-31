//
//  DVCEventTableViewController.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 29/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import UIKit

//        eventTabs = ["Info", "Schedule", "Location", "Team", "Resources", "Tasks", "Contacts", "Attachments", "Customdata"]

class DVCEvent: UIViewController {
    
    var tableView: UITableView = UITableView()
    var eventTabs = [String]()
    var objectId = String() 
    var eventName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTabs = ["Info", "Schedule", "Location", "Team", "Resources", "Tasks", "Contacts", "Attachments", "Customdata"]
        self.view.backgroundColor = UIColor.darkGray
        self.tableView.backgroundColor = UIColor.darkGray
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
    }
    
    
    func initializeInterfaceElements() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
    }
    
    
    func autolayoutInterfaceElements() {
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}


extension DVCEvent: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventTabs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "defaultCell")

        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "defaultCell")
        }
            cell!.textLabel?.text = eventTabs[indexPath.row]
        return cell!
    }
}

extension DVCEvent: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor? = UIColor.darkGray
        cell.textLabel?.textColor = UIColor.lightGray
        tableView.separatorStyle = .none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return eventName
        } else {
            return "eventname"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell: UITableViewCell? = tableView.cellForRow(at: indexPath)

        if indexPath.row == 0 {
            let detailVC: DVCEventInfo = DVCEventInfo()
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else if indexPath.row == 1 {
//            GetSchedule(objectID: GlobalVariable.ObjectId)
            let detailVC: DVCEventSchedule = DVCEventSchedule()
//            detailVC.eventName = eventName
//            detailVC.scheduleList = scheduleList
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else if indexPath.row == 2 {
            let detailVC: DVCEventLocation = DVCEventLocation()
             detailVC.eventName = eventName
            
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else if indexPath.row == 3 {
            let detailVC: DVCEventTeam = DVCEventTeam()
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else if indexPath.row == 4 {
            let detailVC: DVCEventResources = DVCEventResources()
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else if indexPath.row == 5 {
            let detailVC: DVCEventTasks = DVCEventTasks()
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else if indexPath.row == 6 {
            let detailVC: DVCEventContacts = DVCEventContacts()
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else if indexPath.row == 7 {
            let detailVC: DVCEventAttachments = DVCEventAttachments()
            self.navigationController?.pushViewController(detailVC, animated: true)
        } else {
            let detailVC: DVCEventCustomData = DVCEventCustomData()
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
