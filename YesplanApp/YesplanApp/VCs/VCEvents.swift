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
    
    var events = [Event]()
    var contacts = [Contact]()
    var tasks = [Task]()
    var profiles = [Profile]()
    
    var profileColorArray: [String] = []
    
    var selectedDateString = ""
    var selectedEndDateString = ""
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
        GetProfiles()
        GetData()
//        do_table_refresh()
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
            self.GetData()
//            self.do_table_refresh()
            
        }
        
        alertController.addAction(cancelAction)
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        alertController.view.addConstraint(height);
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    @objc func dateSelected(datePicker:UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        selectedDateString = formatter.string(from:datePicker.date)
        let selectedEndDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 10, to: datePicker.date)
        selectedEndDateString = formatter.string(from:selectedEndDate!)
    }
    
    
    @objc func refreshData () {
        
        GetData()
        tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    func GetCurrentDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        selectedDateString = formatter.string(from:Date())
        let selectedEndDate = Calendar.current.date(byAdding: Calendar.Component.day, value: 10, to: Date())
        selectedEndDateString = formatter.string(from:selectedEndDate!)
        
    }
    
    
    func GetData()
    {
        if selectedDateString.isEmpty == true {
            GetCurrentDate()
        }
//        groupedYPEvents.removeAll()
//        groupedYPEventsSorted.removeAll()
//
        let events = Events.from(url: "https://dewerft.yesplan.be/api/events/event%3Adate%3A\(selectedDateString)%20TO%20\(selectedEndDateString)%20event%3Astatus%3Abevestigd?api_key=6AED6266671C92209161289C37D109E0")!
//            dump(events)
        
        print(events.data.count)
        for i in 0 ..< events.data.count {
            let ProfileId = events.data[i].profile.id
            let ProfileColor = profileDict[ProfileId]
//            print(ProfileId)
//            print(ProfileColor!)
            profileColorArray.append(ProfileColor!)
        }
//        let contacts = Contacts.from(url: "https://dewerft.yesplan.be/api/contacts?api_key=6AED6266671C92209161289C37D109E0")!
//           dump(contacts)
//        let tasks = Tasks.from(url: "https://dewerft.yesplan.be/api/tasks/task%3Ateam%3A1203%20-%20task%3Astatus%3Adone?api_key=6AED6266671C92209161289C37D109E0")
//        dump(tasks)
//        let profiles = Profiles.from(url: "https://dewerft.yesplan.be/api/profiles?api_key=6AED6266671C92209161289C37D109E0")!
//                   dump(profiles)
//        let myStatuses = YPData.from(url: "https://dewerft.yesplan.be/api/statuses?api_key=6AED6266671C92209161289C37D109E0")
//        dump(myStatuses)
        
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
    */

}

extension VCEvents: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "header"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileColorArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCEvents") as! TVCEvents
        
//        let borderColor: UIColor = .red
//        print(profileColorArray[indexPath.row])
        if let bordercolor = UIColor(rgbString: profileColorArray[indexPath.row]) {
            cell.ViewBorder.layer.borderColor = bordercolor.cgColor
        } else {
            print("invalid color specification")
        }
       
        
        cell.ViewBorder.layer.cornerRadius = 5
        cell.ViewBorder.layer.borderWidth = 2
        cell.ViewBorder.layer.shadowOffset = CGSize(width: -1, height: 1)
//        cell.ViewBorder.layer.borderColor = borderColor.cgColor
        
 
        cell.LblEventName.text = "Name"
        cell.LblEventLocation.text = "Location"
        cell.LblEventsDefaultschedulestarttime.text = "starttime"
        
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
