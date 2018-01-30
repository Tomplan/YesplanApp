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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTabs = ["Info", "Schedule", "Location", "Team", "Resources", "Tasks", "Contacts", "Attachments", "Customdata"]
        self.view.backgroundColor = UIColor.white
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: UITableViewCell? = tableView.cellForRow(at: indexPath)
        
        if cell != nil {
            let detailVC: DVCEventInfo = DVCEventInfo()
//            detailVC.contentText = cell?.textLabel?.text
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
