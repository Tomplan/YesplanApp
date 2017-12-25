//
//  ViewControllerEvents.swift
//  YesplanApp
//
//  Created by Tom Slegers on 9/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import UIKit

class VCEvents: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var EventDatePicker: UINavigationItem!
    
    var events = [Event]()
    var refreshControl: UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(VCEvents.refreshData), for: UIControlEvents.valueChanged)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        GetStatuses()
        GetProfiles()
        GetEvents()
        do_table_refresh()
    }

    @objc func dateSelected(datePicker:UIDatePicker) {

        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        selectedDateString = formatter.string(from:datePicker.date)
        let selectedEndDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 10, to: datePicker.date)
        selectedEndDateString = formatter.string(from:selectedEndDate!)
        print(selectedDateString)
    }

    @IBAction func SelectDate(_ sender: UIButton) {
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 260))
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.setValue(UIColor.lightGray, forKeyPath: "textColor")
        datePicker.backgroundColor = UIColor.black
        datePicker.addTarget(self, action: #selector(dateSelected(datePicker:)), for: UIControlEvents.valueChanged)
        
        let alertController = UIAlertController(title: "Date Selection", message:" " , preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alertController.view.addSubview(datePicker)//add subview
        
        let cancelAction = UIAlertAction(title: "Done", style: .cancel) { (action) in
            
            self.dateSelected(datePicker: datePicker)
            GetEvents()
            self.do_table_refresh()
            
        }
        
        alertController.addAction(cancelAction)
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        alertController.view.addConstraint(height);
        
        self.present(alertController, animated: true, completion: nil)
        
    }

    @objc func refreshData () {
        
        GetEvents()
        tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func do_table_refresh() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        return
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
//    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DVCEvent" {
            let tabBarController = segue.destination as! TBCEvent
//                tabBarController.setViewControllers([DVCEventInfo, DVCEventTimeSchedules, DVCEventLocation, DVCEventTeam, DVCEventResources, DVCEventContacts, DVCEventAttachments], animated: false)
//            for i in 0 ..< tabBarController.viewControllers!.count {
//                dump(tabBarController.viewControllers![i])
//            }
            let detailVC = tabBarController.viewControllers![0] as! DVCEventTimeSchedules // or whatever tab index you're trying to access
//            destination.property = "some value"
//            let detailVC: DVCEventTimeSchedules? = segue.destination as? DVCEventTimeSchedules
            let cell: UITableViewCell? = sender as? TVCEvents

            let detailCustomDataVC = tabBarController.viewControllers!.last as! DVCEventCustomData
            let customDatacell: UITableViewCell? = sender as? TVCEvents
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row]

                let objectID = object.id
                print("self.objectID: ", objectID)
                GetSchedule(objectID: objectID)
                
                if cell != nil && detailVC != nil {
//                    print(ScheduleList.joined(separator: "\n"))
                    detailVC.ScheduleListText = ScheduleList.joined(separator: "\n")
                }
                GetCustomData(objectID: objectID)
                
                if customDatacell != nil && detailCustomDataVC != nil {
//                    print(CustomDataList.joined(separator: "\n"))
                    print(CustomDataList[0])
                    detailCustomDataVC.CustomDataText = CustomDataList[0]
                    detailCustomDataVC.CustomDataText2 = CustomDataList.joined(separator: "\n")
                }
                
                    
                    //                JSONEventSchedule(objectID: objectID)
                    //                JSONEventResourceBooking(objectID: objectID)
                    //                JSONEventAantalBezet(objectID: objectID)
                    //                JSONEventAantalBeschikbaar(objectID: objectID)
                    //
                    //)
//                    detailVC!.ScheduleListText = ScheduleList.joined(separator: "\n")
                    
//                    detailVC!.EventNameText = object.name
//                    detailVC!.EventDefaultschedulestarttimeText = "\(object.defaultschedulestarttime!) - \(object.defaultscheduleendtime!)"
//                    if object.locations.isEmpty == false {
//                        detailVC!.EventLocationsNameText = object.locations[0].name
//                    } else {
//                        detailVC!.EventLocationsNameText = "zonder locatie"
//                    }
//                    detailVC!.EventScheduleTimeListText =  EventScheduleTimeListSorted.joined(separator: "\n")
//                    detailVC!.ResourceListHumanText =  resourcelisthuman.joined(separator: "\n")
//                    detailVC!.ResourceListMaterialText =  resourcelistmaterial.joined(separator: "\n")
                
            }
            
            
            
        }
        ScheduleList = [String]()
        CustomDataList = [String]()

//        resourcelisthuman = [String]()
//        resourcelistmaterial = [String]()
    }
//}
//
//
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
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "TVCEvents") as! TVCEvents
    
    
    if YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].profile.id.isEmpty != true {
        
        let YPEventProfile = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].profile.id
        let YPEventProfileColor = profileDict[YPEventProfile]!
//        print(YPEventProfileColor)
        
    
    if let bordercolor = UIColor(rgbString: YPEventProfileColor) {
        cell.ViewBorder.layer.borderColor = bordercolor.cgColor
        } else {
            print("invalid color specification")
        }
    
        let YPEventStatus = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].status.name!
        let YPEventStatusColor = statusDict[YPEventStatus]!
        
        if let backgroundcolor = UIColor(rgbString: YPEventStatusColor) {
            cell.ViewBorder.layer.backgroundColor = backgroundcolor.cgColor
        } else {
            print("invalid color specification")
        }
    
        cell.ViewBorder.layer.cornerRadius = 5
        cell.ViewBorder.layer.borderWidth = 4
        cell.ViewBorder.layer.shadowOffset = CGSize(width: -1, height: 1)
    
    }
        cell.LblEventsDefaultschedulestarttime.text =   "\(YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].defaultschedulestarttime!) - \(YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].defaultscheduleendtime!)"
    
    
    
    
        
        if YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].locations.isEmpty != true {
            
            cell.LblEventLocation.text =     YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].locations[0].name
        } else {
            cell.LblEventLocation.text =  "geen locatie!"
            
        }
        cell.LblEventName.text = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].name
        cell.LblEventGroupName.text = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].group?.name
        return cell
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
