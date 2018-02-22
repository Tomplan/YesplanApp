//
//  ViewControllerEvents.swift
//  YesplanApp
//
//  Created by Tom Slegers on 9/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import UIKit

class VCEvents: UIViewController {
    
    var tableView: UITableView = UITableView()
    
    var refreshControl: UIRefreshControl = UIRefreshControl()

    let dateFormatter = DateFormatter()
    var datePicker : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Events"
        self.view.backgroundColor = UIColor.lightGray
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Date", style: .plain, target: self, action: #selector(addTapped))
        
        refreshControl.addTarget(self, action: #selector(VCEvents.refreshData), for: UIControlEvents.valueChanged)
        GetStatuses()
        GetProfiles()
        GetEvents()
        do_table_refresh()
        
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
    
    @objc func addTapped(){
        doDatePicker()
    }
    
    func doDatePicker(){
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 260))
        self.datePicker.backgroundColor = UIColor.darkGray
        self.datePicker.setValue(UIColor.lightGray, forKeyPath: "textColor")
        self.datePicker.datePickerMode = UIDatePickerMode.date
//        self.datePicker.center = view.center
        self.datePicker.addTarget(self, action: #selector(dateSelected(datePicker:)), for: UIControlEvents.valueChanged)

        let alertController = UIAlertController(title: "Date Selection", message:" " , preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alertController.view.addSubview(self.datePicker)//add subview
        
        let cancelAction = UIAlertAction(title: "Done", style: .cancel) { (action) in
            
        self.dateSelected(datePicker: self.datePicker)
        GetEvents()
        self.do_table_refresh()
            
        }
        
        alertController.addAction(cancelAction)
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        alertController.view.addConstraint(height);
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func do_table_refresh() {
    
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        return
    }
    
    @objc func dateSelected(datePicker:UIDatePicker) {
        
                let formatter = DateFormatter()
                formatter.dateFormat = "dd-MM-yyyy"
                selectedDateString = formatter.string(from:datePicker.date)
                let selectedEndDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 10, to: datePicker.date)
                selectedEndDateString = formatter.string(from:selectedEndDate!)
                print(selectedDateString)
            }
    
    @objc func refreshData () {
        
        GetEvents()
        tableView.reloadData()
        self.refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension VCEvents: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return YPgroupedEventsSorted.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return stringToEventsDate(myDateString: YPgroupedEventsSorted[section].date)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return YPgroupedEventsSorted[section].YPEvents.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    var cell: TVCEvents? = tableView.dequeueReusableCell(withIdentifier: "TVCEvents") as? TVCEvents
    if cell == nil {
        cell = TVCEvents(style: .default, reuseIdentifier: "TVCEvents")
    }

        if YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].profile!.id?.isEmpty != true {

        let YPEventProfile = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].profile!.id
            let YPEventProfileColor = profileDict[YPEventProfile!]!
 
        if let bordercolor = UIColor(rgbString: YPEventProfileColor) {
            cell!.layer.borderColor = bordercolor.cgColor
        } else {
            print("invalid color specification")
        }

        let YPEventStatus = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].status!.name!
        let YPEventStatusColor = statusDict[YPEventStatus]!

        if let backgroundcolor = UIColor(rgbString: YPEventStatusColor) {
//            cell.layer.backgroundColor = backgroundcolor.cgColor
            cell!.backgroundColor = backgroundcolor
        } else {
            print("invalid color specification")
        }


    }
        cell!.LblEventsDefaultschedulestarttime.text = "\(YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].defaultschedulestarttime ?? "no starttime") - \(YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].defaultscheduleendtime ?? "no endtime")"
//
        if YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].locations.isEmpty != true {
//
            cell!.LblEventLocation.text = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].locations[0].name
//        } else {
//            cell!.LblEventLocation.text =  "geen locatie!"
//
        }
        cell!.LblEventName.text = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].name!
////    print(YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].name!)
        cell!.LblEventGroupName.text = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].group?.name
    
        return cell!
    }

}

extension VCEvents: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let _: UITableViewCell = tableView.cellForRow(at: indexPath) {
            
            let object = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row]
            let detailVC = DVCEvent()
//            detailVC.objectId = object.id
            GlobalVariable.ObjectId = object.id
            GlobalVariable.URL = object.url
            if let eventName = object.name {
            detailVC.eventName = eventName
            }
            if let eventGroupName = object.group?.name {
                detailVC.eventGroupName = eventGroupName
            }
//            if let eventGroupName = object.group?.name {
//            detailVC.eventGroupName = eventGroupName
//            }
            self.navigationController!.pushViewController(detailVC, animated: true)
        }
    }
}


extension UIColor {
    convenience init?(rgbString: String) {
        var red = 0.0
        var green = 0.0
        var blue = 0.0

        let scanner = Scanner(string: rgbString)
        guard scanner.scanString("rgb(", into: nil)
            && scanner.scanDouble(&red)
            && scanner.scanString(",", into: nil)
            && scanner.scanDouble(&green)
            && scanner.scanString(",", into: nil)
            && scanner.scanDouble(&blue)
            && scanner.scanString(")", into: nil) else {
                return nil
        }
        self.init(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: 1.0)
    }
}

