//
//  DVCEvent.swift
//  YesplanApp
//
//  Created by Techcc - FOH - Video on 29/01/18.
//  Copyright © 2018 TomPlan. All rights reserved.
//

import UIKit

class DVCEvent: UITabBarController {

    var eventWindow: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        self.title = "Eventinfo"
        
        let EventDVC01: DVCEventInfo = DVCEventInfo()
        EventDVC01.tabBarItem.title = "Info"
        EventDVC01.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        EventDVC01.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC02: DVCEventTimeSchedules = DVCEventTimeSchedules()
        EventDVC02.tabBarItem.title = "TimeSchedules"
        EventDVC02.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        EventDVC02.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC03: DVCEventLocation = DVCEventLocation()
        EventDVC03.tabBarItem.title = "Location"
        EventDVC03.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        EventDVC03.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC04: DVCEventTeam = DVCEventTeam()
        EventDVC04.tabBarItem.title = "Team"
        EventDVC04.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        EventDVC04.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC05: DVCEventResources = DVCEventResources()
        EventDVC05.tabBarItem.title = "Resources"
        EventDVC05.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        EventDVC05.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC06: DVCEventTasks = DVCEventTasks()
        EventDVC06.tabBarItem.title = "Tasks"
        EventDVC06.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        EventDVC06.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC07: DVCEventContacts = DVCEventContacts()
        EventDVC07.tabBarItem.title = "Contacts"
        EventDVC07.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        EventDVC07.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC08: DVCEventAttachments = DVCEventAttachments()
        EventDVC08.tabBarItem.title = "Attachments"
        EventDVC08.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        EventDVC08.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC09: DVCEventCustomData = DVCEventCustomData()
        EventDVC09.tabBarItem.title = "Customdata"
        EventDVC09.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        EventDVC09.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        
        let eventTabBarCon: UITabBarController = UITabBarController()
        eventTabBarCon.setViewControllers([EventDVC01, EventDVC02, EventDVC03, EventDVC04, EventDVC05, EventDVC06, EventDVC07, EventDVC08, EventDVC09], animated: false)
        eventTabBarCon.tabBar.barTintColor = UIColor.black
        eventTabBarCon.tabBar.tintColor = UIColor.darkGray
        eventTabBarCon.moreNavigationController.navigationBar.barTintColor = UIColor.init(red: 125.0/255.0, green: 125.0/255.0, blue: 125.0/255.0, alpha: 1.0)
        
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        
        self.eventWindow = UIWindow()
        self.eventWindow!.rootViewController = eventTabBarCon // UINavigationController(rootViewController: VCEvents())
        self.eventWindow!.backgroundColor = UIColor.darkGray
        self.eventWindow!.makeKeyAndVisible()
        
    }
    
    
    func initializeInterfaceElements() {
//        self.contentLabel = UILabel()
//        self.contentLabel!.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(self.contentLabel!)
    }
    
    
    func autolayoutInterfaceElements() {
//        self.contentLabel!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        self.contentLabel!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
}
