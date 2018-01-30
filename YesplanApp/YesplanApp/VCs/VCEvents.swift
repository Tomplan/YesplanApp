//
//  ViewControllerEvents.swift
//  YesplanApp
//
//  Created by Tom Slegers on 9/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import UIKit

class VCEvents: UIViewController {
    
    var TVEvents: UITableView = UITableView()
    
    var refreshControl: UIRefreshControl = UIRefreshControl()

    let dateFormatter = DateFormatter()
    let locale = NSLocale.current
    var datePicker : UIDatePicker!
//    let toolBar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Events"
        self.view.backgroundColor = UIColor.lightGray
        self.TVEvents.dataSource = self
        self.TVEvents.delegate = self
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Date", style: .plain, target: self, action: #selector(addTapped))
        
        refreshControl.addTarget(self, action: #selector(VCEvents.refreshData), for: UIControlEvents.valueChanged)
        GetStatuses()
        GetProfiles()
        GetEvents()
        do_table_refresh()
        print("in viewDIDLOAD")
        
        
    }
   
    
    func initializeInterfaceElements() {
        self.TVEvents.translatesAutoresizingMaskIntoConstraints = false
        self.TVEvents.dataSource = self
//        self.TVEvents.delegate = self
        self.view.addSubview(self.TVEvents)
    }
    
    
    func autolayoutInterfaceElements() {
        self.TVEvents.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.TVEvents.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.TVEvents.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.TVEvents.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
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
//            print("hier")
            self.do_table_refresh()
            
        }
        
        alertController.addAction(cancelAction)
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        alertController.view.addConstraint(height);
        
        self.present(alertController, animated: true, completion: nil)
        
    
//        view.addSubview(self.datePicker)
//        //
//        // ToolBar
        
//        toolBar.barStyle = .default
//        toolBar.isTranslucent = true
//        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
//        toolBar.sizeToFit()
//
        // Adding Button ToolBar
//        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(VCEvents.doneClick))
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(VCEvents.cancelClick))
//        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
//        toolBar.isUserInteractionEnabled = true
//
//        self.view.addSubview(toolBar)
//        self.toolBar.isHidden = false
        
        
    }
    
    func do_table_refresh() {
    
        DispatchQueue.main.async {
            self.TVEvents.reloadData()
        }
        return
    }
    
//    @objc func doneClick() {
//        let dateFormatter1 = DateFormatter()
//        dateFormatter1.dateStyle = .medium
//        dateFormatter1.timeStyle = .none
////        setNotification()
//        //self.datePicker.resignFirstResponder()
//        datePicker.isHidden = true
//        self.toolBar.isHidden = true
//    }
//
//    @objc func cancelClick() {
//        datePicker.isHidden = true
//        self.toolBar.isHidden = true
//    }
    
    @objc func dateSelected(datePicker:UIDatePicker) {
        
                let formatter = DateFormatter()
                formatter.dateFormat = "dd-MM-yyyy"
                selectedDateString = formatter.string(from:datePicker.date)
                let selectedEndDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 10, to: datePicker.date)
                selectedEndDateString = formatter.string(from:selectedEndDate!)
                print(selectedDateString)
            }
    
//    @IBAction func SelectDate(_ sender: UIButton) {
//
//                let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 260))
//                datePicker.datePickerMode = UIDatePickerMode.date
//                datePicker.setValue(UIColor.lightGray, forKeyPath: "textColor")
//                datePicker.backgroundColor = UIColor.black
//                datePicker.addTarget(self, action: #selector(dateSelected(datePicker:)), for: UIControlEvents.valueChanged)
//
//                let alertController = UIAlertController(title: "Date Selection", message:" " , preferredStyle: UIAlertControllerStyle.actionSheet)
//
//                alertController.view.addSubview(datePicker)//add subview
//
//                let cancelAction = UIAlertAction(title: "Done", style: .cancel) { (action) in
//
//                    self.dateSelected(datePicker: datePicker)
////                    GetEvents()
//                    print("hier")
//        //            self.do_table_refresh()
//
//                }
//
//                alertController.addAction(cancelAction)
//
//                let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
//                alertController.view.addConstraint(height);
//
//                self.present(alertController, animated: true, completion: nil)
//
//            }

    @objc func refreshData () {
        
        GetEvents()
        TVEvents.reloadData()
        self.refreshControl.endRefreshing()
    }


//        self.tableView.dataSource = self
//
//        refreshControl.addTarget(self, action: #selector(VCEvents.refreshData), for: UIControlEvents.valueChanged)
//
//    }
    
    


//    @IBOutlet weak var EventDatePicker: UINavigationItem!
    
//    var events = [Event_Id]()
//    var refreshControl: UIRefreshControl = UIRefreshControl()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        self.tableView.dataSource = self
//
//        refreshControl.addTarget(self, action: #selector(VCEvents.refreshData), for: UIControlEvents.valueChanged)
//
//        if #available(iOS 10.0, *) {
//            tableView.refreshControl = refreshControl
//        } else {
//            tableView.addSubview(refreshControl)
//        }
//        GetStatuses()
//        GetProfiles()
//        GetEvents()
//        do_table_refresh()
//    }
//
//    @objc func dateSelected(datePicker:UIDatePicker) {
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd-MM-yyyy"
//        selectedDateString = formatter.string(from:datePicker.date)
//        let selectedEndDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 10, to: datePicker.date)
//        selectedEndDateString = formatter.string(from:selectedEndDate!)
//        print(selectedDateString)
//    }
//
//    @IBAction func SelectDate(_ sender: UIButton) {
//
// //       let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 260))
//        datePicker.datePickerMode = UIDatePickerMode.date
//        datePicker.setValue(UIColor.lightGray, forKeyPath: "textColor")
//        datePicker.backgroundColor = UIColor.black
//        datePicker.addTarget(self, action: #selector(dateSelected(datePicker:)), for: UIControlEvents.valueChanged)
//
//        let alertController = UIAlertController(title: "Date Selection", message:" " , preferredStyle: UIAlertControllerStyle.actionSheet)
//
//        alertController.view.addSubview(datePicker)//add subview
//
//        let cancelAction = UIAlertAction(title: "Done", style: .cancel) { (action) in
//
//            self.dateSelected(datePicker: datePicker)
//            GetEvents()
////            self.do_table_refresh()
//
//        }
//
//        alertController.addAction(cancelAction)
//
//        let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
//        alertController.view.addConstraint(height);
//
//        self.present(alertController, animated: true, completion: nil)
//
//    }

//    @objc func refreshData () {
//
//        GetEvents()
//        tableView.reloadData()
//        self.refreshControl.endRefreshing()
//    }

//    func do_table_refresh() {
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//        return
//    }


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
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "DVCEvent" {
//            let tabBarController = segue.destination as! TBCEvent
////                tabBarController.setViewControllers([DVCEventInfo, DVCEventTimeSchedules, DVCEventLocation, DVCEventTeam, DVCEventResources, DVCEventContacts, DVCEventAttachments], animated: false)
////            for i in 0 ..< tabBarController.viewControllers!.count {
////                dump(tabBarController.viewControllers![i])
////            }
//            let detailVC = tabBarController.viewControllers![0] as! DVCEventTimeSchedules // or whatever tab index you're trying to access
////            destination.property = "some value"
////            let detailVC: DVCEventTimeSchedules? = segue.destination as? DVCEventTimeSchedules
//            let cell: UITableViewCell? = sender as? TVCEvents
//
//            let detailCustomDataVC = tabBarController.viewControllers!.last as! DVCEventCustomData
//            let customDatacell: UITableViewCell? = sender as? TVCEvents
//
//            if let indexPath = tableView.indexPathForSelectedRow {
//                let object = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row]
//
//                let objectID = object.id
//                print("self.objectID: ", objectID)
//                GetSchedule(objectID: objectID)
//
//                if cell != nil && detailVC != nil {
////                    print(ScheduleList.joined(separator: "\n"))
//                    detailVC.ScheduleListText = ScheduleList.joined(separator: "\n")
//                }
//                GetCustomData(objectID: objectID)
//
//                if customDatacell != nil && detailCustomDataVC != nil {
////                    print(CustomDataList.joined(separator: "\n"))
//                    if CustomDataList.isEmpty == false {
//                    print(CustomDataList[0])
//                    detailCustomDataVC.CustomDataText = CustomDataList[0]
//                    detailCustomDataVC.CustomDataText2 = CustomDataList.joined(separator: "\n")
//                }
//                }
//                    
//            }
//
//
//
//        }
//        ScheduleList = [String]()
//        CustomDataList = [String]()
//
////        resourcelisthuman = [String]()
////        resourcelistmaterial = [String]()
//    }
////}
////
////
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

    if YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].profile!.id.isEmpty != true {

        let YPEventProfile = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].profile!.id
        let YPEventProfileColor = profileDict[YPEventProfile]!
 
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
        cell!.LblEventsDefaultschedulestarttime.text = "\(YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].defaultschedulestarttime!) - \(YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].defaultscheduleendtime!)"
//
        if YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].locations!.isEmpty != true {
//
            cell!.LblEventLocation.text = YPgroupedEventsSorted[indexPath.section].YPEvents[indexPath.row].locations![0].name
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
        
        let cell: UITableViewCell? = tableView.cellForRow(at: indexPath)

        if cell != nil {
            print("hierse")
//            let VC1 = self.storyboard!.instantiateViewController(withIdentifier: "DVCEvent") as! EVCEvent
//            let VC1 = DVCEvent() //change this to your class name
//            self.present(VC1, animated: true, completion: nil)
//            self.navigationController!.pushViewController(VC1, animated: true)
            let detailVC = DVCEvent()
//
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

