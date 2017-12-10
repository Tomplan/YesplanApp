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
    
    var myYPData = [Event]()
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
        
        let myYPData = YPData.from(url: "https://dewerft.yesplan.be/api/events/event%3Adate%3A\(selectedDateString)%20TO%20\(selectedEndDateString)%20event%3Astatus%3Abevestigd?api_key=6AED6266671C92209161289C37D109E0")!
        
        //        ************* vraag aan Erwin: max download events = 100? ****************
        
//        self.YPEvents = myYPData.data
        dump(myYPData.data)
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TVCEvents") as! TVCEvents
        
        cell.LblEventName.text = "Name"
        cell.LblEventLocation.text = "Location"
        cell.LblEventsDefaultschedulestarttime.text = "starttime"
        
        return cell
    }
}
