//
//  VCTeamplanner.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 28/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import UIKit

class VCTeamplanner: UIViewController {
    
    var tableView: UITableView = UITableView()
    var teamplanner: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Teamplanner"
        self.view.backgroundColor = UIColor.lightGray
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        
    }
    
    func initializeInterfaceElements() {
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

extension VCTeamplanner: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor? = UIColor.darkGray
        cell.textLabel?.textColor = UIColor.lightGray
        tableView.separatorStyle = .none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10 // objectArray.count // taskSection.count
    }
    
    //        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //            identifier = objectArray[section].sectionName
    //            return identifier
    //        }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        identifier = objectArray[section].sectionName
//        let button = UIButton(type: .system)
//        button.backgroundColor = UIColor.lightGray
//        button.setTitle("\(identifier)", for: .normal) // or add "open" to the title
//        button.setTitleColor(.black, for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//
//        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
//
//        button.tag = section
//        return button
//    }
//
//    @objc func handleExpandClose(button: UIButton) {
//
//        let section = button.tag
//        var indexPaths = [IndexPath]()
//
//        for row in collapseArray[section].names.indices {
//            let indexPath = IndexPath(row: row, section: section)
//            indexPaths.append(indexPath)
//        }
//
//
//        let isExpanded = collapseArray[section].isExpanded
//        collapseArray[section].isExpanded = !isExpanded
//
//        identifier = objectArray[section].sectionName
//        button.setTitle(isExpanded ? "\(identifier)" : "\(identifier)" , for: .normal) // or  "\(identifier) Open" : "\(identifier) Close"
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//
//        if isExpanded {
//            tableView.deleteRows(at: indexPaths, with: .fade)
//        } else {
//            tableView.insertRows(at: indexPaths, with: .fade)
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if !collapseArray[section].isExpanded {
//            return 0
//        }
        return 5 // collapseArray[section].names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "defaultCell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "defaultCell")
        }
        
        cell!.textLabel?.text = "cellinhoud" // objectArray[indexPath.section].sectionObjects[indexPath.row]
        cell!.textLabel?.numberOfLines = 0
        return cell!
    }
    
    //        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //                print(objectArray[indexPath.section].sectionObjects)
    //
    ////            GlobalVariable.URL = task.
    ////            print("task: ", task)
    ////           let waauw =  task.index(forKey: "url")
    ////            print("waauw", waauw)
    ////                let detailVC: DVCTableView = DVCTableView()
    //////                GlobalVariable.ObjectId =
    ////                self.navigationController?.pushViewController(detailVC, animated: true)
    //
    //        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}

