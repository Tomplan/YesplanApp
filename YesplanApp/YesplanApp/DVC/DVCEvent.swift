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
//        self.view.backgroundColor = UIColor.yellow
//        self.title = "Eventinfo"
//
//        UITabBar.appearance().barTintColor = UIColor.black
//        //        UITabBar.appearance().tintColor = UIColor.green
//
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.darkGray], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .selected)
//
        let EventDVC01: DVCEventInfo = DVCEventInfo()
        EventDVC01.tabBarItem.title = "Info"
//        EventDVC01.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//        EventDVC01.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC02: DVCEventTimeSchedules = DVCEventTimeSchedules()
        EventDVC02.tabBarItem.title = "TimeSchedules"
//        EventDVC02.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//        EventDVC02.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC03: DVCEventLocation = DVCEventLocation()
        EventDVC03.tabBarItem.title = "Location"
//        EventDVC03.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//        EventDVC03.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC04: DVCEventTeam = DVCEventTeam()
        EventDVC04.tabBarItem.title = "Team"
//        EventDVC04.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//        EventDVC04.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC05: DVCEventResources = DVCEventResources()
        EventDVC05.tabBarItem.title = "Resources"
//        EventDVC05.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//        EventDVC05.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC06: DVCEventTasks = DVCEventTasks()
        EventDVC06.tabBarItem.title = "Tasks"
//        EventDVC06.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//        EventDVC06.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC07: DVCEventContacts = DVCEventContacts()
        EventDVC07.tabBarItem.title = "Contacts"
//        EventDVC07.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//        EventDVC07.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC08: DVCEventAttachments = DVCEventAttachments()
        EventDVC08.tabBarItem.title = "Attachments"
//        EventDVC08.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//        EventDVC08.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        let EventDVC09: DVCEventCustomData = DVCEventCustomData()
        EventDVC09.tabBarItem.title = "Customdata"
//        EventDVC09.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//        EventDVC09.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
        
//        let DVCnav = UINavigationController(rootViewController: EventDVC01)
        
        let eventTabBarController: UITabBarController = UITabBarController()
        let eventControllers = [EventDVC01, EventDVC02, EventDVC03, EventDVC04, EventDVC05, EventDVC06, EventDVC07, EventDVC08, EventDVC09]
        eventTabBarController.viewControllers = eventControllers.map { UINavigationController(rootViewController: $0)}
        //
        //        UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
        //        UINavigationBar.appearance().shadowImage = UIImage()
        //        UINavigationBar.appearance().tintColor = UIColor.green
        UINavigationBar.appearance().barTintColor = UIColor.black // ok // Style.SELECTED_COLOR
        //        UINavigationBar.appearance().isTranslucent = false
        //        UINavigationBar.appearance().clipsToBounds = false
        //        UINavigationBar.appearance().backgroundColor =  UIColor.purple // Style.SELECTED_COLOR
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.lightGray] // ok
        //        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font : (UIFont(name: "Arial", size: 10))!]
        
//        eventTabBarController.delegate = self
////
//        if eventTabBarController.viewControllers != nil {
//                        print(eventTabBarController.viewControllers!)
//            for i in 0 ..< eventTabBarController.viewControllers!.count {
//                let dvc: UIViewController = eventTabBarController.viewControllers![i]
//                dvc.tabBarItem.tag = i
//                //                customizableViewControllers.append(vc)
//            }
//        }
////
//        let eventDefaults: UserDefaults = UserDefaults.standard
//        let eventTabOrder: [Int]? = defaults.object(forKey: "tabOrder") as? [Int]
//        
//        if eventTabOrder != nil {
//            var dvcOrder: [UIViewController] = []
//            for tag: Int in eventTabOrder! {
//                for dvc in eventTabBarController.viewControllers! {
//                    if dvc.tabBarItem.tag == tag {
//                        dvcOrder.append(dvc)
//                    }
//                }
//            }
//            eventTabBarController.viewControllers = dvcOrder
//            //            tabBarController.customizableViewControllers = customizableViewControllers
//            //            print("customize: ", tabBarController.customizableViewControllers!)
//        }
        self.initializeInterfaceElements()
        self.autolayoutInterfaceElements()
        
        self.eventWindow = UIWindow()
        self.eventWindow!.rootViewController = eventTabBarController // UINavigationController(rootViewController: VCEvents())
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
//
//extension DVCEvent: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
//        if changed {
//            //            print("done")
//            var eventTabOrder: [Int] = []
////            print("viewControllers: ", viewControllers)
//            for vc: UIViewController in viewControllers {
//                eventTabOrder.append(vc.tabBarItem.tag)
//            }
//            //            print(tabOrder)
//            let eventDefaults: UserDefaults = UserDefaults.standard
//            eventDefaults.set(eventTabOrder, forKey: "tabOrder")
//        }
//    }
//}

