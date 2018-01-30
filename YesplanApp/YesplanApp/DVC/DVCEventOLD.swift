////
////  DVCEvent.swift
////  YesplanApp
////
////  Created by Techcc - FOH - Video on 29/01/18.
////  Copyright © 2018 TomPlan. All rights reserved.
////
//
//import UIKit
//
//class DVCEvent: UIViewController {
//
//
//    let navSegmentControl = UISegmentedControl()
//    let containerView = UIView()
//    
//    lazy var DVC01: DVCEventInfo = {
//        let vc = DVCEventInfo()
//        self.addAsChildVC(childVC: vc)
//        return vc
//    }()
//    
//    lazy var DVC02: DVCEventSchedule = {
//        let vc = DVCEventSchedule()
//        self.addAsChildVC(childVC: vc)
//        return vc
//    }()
//    
//    lazy var DVC03: DVCEventLocation = {
//        let vc = DVCEventLocation()
//        self.addAsChildVC(childVC: vc)
//        return vc
//    }()
//    
//    lazy var DVC04: DVCEventTeam = {
//        let vc = DVCEventTeam()
//        self.addAsChildVC(childVC: vc)
//        return vc
//    }()
//    
//    lazy var DVC05: DVCEventResources = {
//        let vc = DVCEventResources()
//        self.addAsChildVC(childVC: vc)
//        return vc
//    }()
//    
//    lazy var DVC06: DVCEventTasks = {
//        let vc = DVCEventTasks()
//        self.addAsChildVC(childVC: vc)
//        return vc
//    }()
//    
//    lazy var DVC07: DVCEventContacts = {
//        let vc = DVCEventContacts()
//        self.addAsChildVC(childVC: vc)
//        return vc
//    }()
//    
//    lazy var DVC08: DVCEventAttachments = {
//        let vc = DVCEventAttachments()
//        self.addAsChildVC(childVC: vc)
//        return vc
//    }()
//    
//    lazy var DVC09: DVCEventCustomData = {
//        let vc = DVCEventCustomData()
//        self.addAsChildVC(childVC: vc)
//        return vc
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViews()
////        DVC01.view.isHidden = false
//
//    }
//    
//    func addAsChildVC(childVC: UIViewController) {
//        addChildViewController(childVC)
//        containerView.addSubview(childVC.view)
//        childVC.view.frame = self.view.frame
//        childVC.didMove(toParentViewController: self)
//    }
//    
//    private func removeAsChildVC(childVC: UIViewController) {
//        childVC.willMove(toParentViewController: nil)
//        childVC.view.removeFromSuperview()
//        childVC.removeFromParentViewController()
//    }
//    
//    @objc func madeSelection(_ sender: UISegmentedControl) {
//            switch sender.selectedSegmentIndex {
//            case 0:
//                print(sender.selectedSegmentIndex)
//                DVC01.view.isHidden = false
//                DVC02.view.isHidden = true
//                DVC03.view.isHidden = true
//                DVC04.view.isHidden = true
//                DVC05.view.isHidden = true
//                DVC06.view.isHidden = true
//                DVC07.view.isHidden = true
//                DVC08.view.isHidden = true
//                DVC09.view.isHidden = true
//
//                
//            case 1:
//                print(sender.selectedSegmentIndex)
//                DVC01.view.isHidden = true
//                DVC02.view.isHidden = false
//                DVC03.view.isHidden = true
//                DVC04.view.isHidden = true
//                DVC05.view.isHidden = true
//                DVC06.view.isHidden = true
//                DVC07.view.isHidden = true
//                DVC08.view.isHidden = true
//                DVC09.view.isHidden = true
//
//            case 2:
//                print(sender.selectedSegmentIndex)
//                DVC01.view.isHidden = true
//                DVC02.view.isHidden = true
//                DVC03.view.isHidden = false
//                DVC04.view.isHidden = true
//                DVC05.view.isHidden = true
//                DVC06.view.isHidden = true
//                DVC07.view.isHidden = true
//                DVC08.view.isHidden = true
//                DVC09.view.isHidden = true
//
//            case 3:
//                print(sender.selectedSegmentIndex)
//                DVC01.view.isHidden = true
//                DVC02.view.isHidden = true
//                DVC03.view.isHidden = true
//                DVC04.view.isHidden = false
//                DVC05.view.isHidden = true
//                DVC06.view.isHidden = true
//                DVC07.view.isHidden = true
//                DVC08.view.isHidden = true
//                DVC09.view.isHidden = true
//                
//            case 4:
//                print(sender.selectedSegmentIndex)
//                DVC01.view.isHidden = true
//                DVC02.view.isHidden = true
//                DVC03.view.isHidden = true
//                DVC04.view.isHidden = true
//                DVC05.view.isHidden = false
//                DVC06.view.isHidden = true
//                DVC07.view.isHidden = true
//                DVC08.view.isHidden = true
//                DVC09.view.isHidden = true
//                
//            case 5:
//                print(sender.selectedSegmentIndex)
//                DVC01.view.isHidden = true
//                DVC02.view.isHidden = true
//                DVC03.view.isHidden = true
//                DVC04.view.isHidden = true
//                DVC05.view.isHidden = true
//                DVC06.view.isHidden = false
//                DVC07.view.isHidden = true
//                DVC08.view.isHidden = true
//                DVC09.view.isHidden = true
//
//            case 6:
//                print(sender.selectedSegmentIndex)
//                DVC01.view.isHidden = true
//                DVC02.view.isHidden = true
//                DVC03.view.isHidden = true
//                DVC04.view.isHidden = true
//                DVC05.view.isHidden = true
//                DVC06.view.isHidden = true
//                DVC07.view.isHidden = false
//                DVC08.view.isHidden = true
//                DVC09.view.isHidden = true
//                
//            case 7:
//                print(sender.selectedSegmentIndex)
//                DVC01.view.isHidden = true
//                DVC02.view.isHidden = true
//                DVC03.view.isHidden = true
//                DVC04.view.isHidden = true
//                DVC05.view.isHidden = true
//                DVC06.view.isHidden = true
//                DVC07.view.isHidden = true
//                DVC08.view.isHidden = false
//                DVC09.view.isHidden = true
//
//            case 8:
//                print(sender.selectedSegmentIndex)
//                DVC01.view.isHidden = true
//                DVC02.view.isHidden = true
//                DVC03.view.isHidden = true
//                DVC04.view.isHidden = true
//                DVC05.view.isHidden = true
//                DVC06.view.isHidden = true
//                DVC07.view.isHidden = true
//                DVC08.view.isHidden = true
//                DVC09.view.isHidden = false
//                
//            default:
//                print(sender.selectedSegmentIndex)
//                DVC01.view.isHidden = false
//                DVC02.view.isHidden = true
//                DVC03.view.isHidden = true
//                DVC04.view.isHidden = true
//                DVC05.view.isHidden = true
//                DVC06.view.isHidden = true
//                DVC07.view.isHidden = true
//                DVC08.view.isHidden = true
//                DVC09.view.isHidden = true
//
//                
//                break;
//            }
//    }
//    
//    func setupViews() {
//        
//        let screenHeight = UIScreen.main.bounds.height
//        view.backgroundColor = UIColor.darkGray
////        navSegmentControl.backgroundColor = UIColor.darkGray
//        navSegmentControl.tintColor = UIColor.lightGray
//        
//        navSegmentControl.addTarget(self, action: #selector(madeSelection), for: .valueChanged)
////
//        navSegmentControl.insertSegment(withTitle: "Info", at: 0, animated: false)
//        navSegmentControl.insertSegment(withTitle: "Schedule", at: 1, animated: false)
//        navSegmentControl.insertSegment(withTitle: "Location", at: 2, animated: false)
//        navSegmentControl.insertSegment(withTitle: "Team", at: 3, animated: false)
//        navSegmentControl.insertSegment(withTitle: "Resources", at: 4, animated: false)
//        navSegmentControl.insertSegment(withTitle: "Tasks", at: 5, animated: false)
//        navSegmentControl.insertSegment(withTitle: "Contacts", at: 6, animated: false)
//        navSegmentControl.insertSegment(withTitle: "Attachments", at: 7, animated: false)
//        navSegmentControl.insertSegment(withTitle: "Customdata", at: 8, animated: false)
//
//        
////
////        navSegmentControl.selectedSegmentIndex = 1
////
//        view.addSubview(containerView)
//        view.addSubview(navSegmentControl)
//
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        containerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
//        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//
//        navSegmentControl.translatesAutoresizingMaskIntoConstraints = false
//        navSegmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        navSegmentControl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: screenHeight / -2.6).isActive = true
////
//    }
//    
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////    var eventWindow: UIWindow?
////
////    override func viewDidLoad() {
////        super.viewDidLoad()
//////        self.view.backgroundColor = UIColor.yellow
//////        self.title = "Eventinfo"
//////
//////        UITabBar.appearance().barTintColor = UIColor.black
//////        //        UITabBar.appearance().tintColor = UIColor.green
//////
//////        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.darkGray], for: .normal)
//////        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .selected)
//////
////        let EventDVC01: DVCEventInfo = DVCEventInfo()
////        EventDVC01.tabBarItem.title = "Info"
//////        EventDVC01.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//////        EventDVC01.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
////        let EventDVC02: DVCEventTimeSchedules = DVCEventTimeSchedules()
////        EventDVC02.tabBarItem.title = "TimeSchedules"
//////        EventDVC02.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//////        EventDVC02.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
////        let EventDVC03: DVCEventLocation = DVCEventLocation()
////        EventDVC03.tabBarItem.title = "Location"
//////        EventDVC03.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//////        EventDVC03.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
////        let EventDVC04: DVCEventTeam = DVCEventTeam()
////        EventDVC04.tabBarItem.title = "Team"
//////        EventDVC04.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//////        EventDVC04.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
////        let EventDVC05: DVCEventResources = DVCEventResources()
////        EventDVC05.tabBarItem.title = "Resources"
//////        EventDVC05.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//////        EventDVC05.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
////        let EventDVC06: DVCEventTasks = DVCEventTasks()
////        EventDVC06.tabBarItem.title = "Tasks"
//////        EventDVC06.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//////        EventDVC06.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
////        let EventDVC07: DVCEventContacts = DVCEventContacts()
////        EventDVC07.tabBarItem.title = "Contacts"
//////        EventDVC07.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//////        EventDVC07.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
////        let EventDVC08: DVCEventAttachments = DVCEventAttachments()
////        EventDVC08.tabBarItem.title = "Attachments"
//////        EventDVC08.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//////        EventDVC08.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
////        let EventDVC09: DVCEventCustomData = DVCEventCustomData()
////        EventDVC09.tabBarItem.title = "Customdata"
//////        EventDVC09.tabBarItem.image = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
//////        EventDVC09.tabBarItem.selectedImage = UIImage(named: "")?.withRenderingMode(.alwaysOriginal)
////
//////        let DVCNav = UINavigationController(rootViewController: EventDVC01)
////
////        let eventTabBarController: UITabBarController = UITabBarController()
////        let eventControllers = [EventDVC01, EventDVC02, EventDVC03, EventDVC04, EventDVC05, EventDVC06, EventDVC07, EventDVC08, EventDVC09]
////        eventTabBarController.viewControllers = eventControllers//.map { UINavigationController(rootViewController: $0) }
////        //
////        //        UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
////        //        UINavigationBar.appearance().shadowImage = UIImage()
////        //        UINavigationBar.appearance().tintColor = UIColor.green
////        UINavigationBar.appearance().barTintColor = UIColor.black // ok // Style.SELECTED_COLOR
////        //        UINavigationBar.appearance().isTranslucent = false
////        //        UINavigationBar.appearance().clipsToBounds = false
////        //        UINavigationBar.appearance().backgroundColor =  UIColor.purple // Style.SELECTED_COLOR
////        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.lightGray] // ok
////        //        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font : (UIFont(name: "Arial", size: 10))!]
//////        let yourBackImage = UIImage(named: "BackButton")
//////        self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
//////        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
//////        self.navigationController?.navigationBar.backItem?.title = "Custom"
//////
//////        navigationItem.leftItemsSupplementBackButton = true
//////        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
//////        eventTabBarController.delegate = self
////////
//////        if eventTabBarController.viewControllers != nil {
//////                        print(eventTabBarController.viewControllers!)
//////            for i in 0 ..< eventTabBarController.viewControllers!.count {
//////                let dvc: UIViewController = eventTabBarController.viewControllers![i]
//////                dvc.tabBarItem.tag = i
//////                //                customizableViewControllers.append(vc)
//////            }
//////        }
////////
//////        let eventDefaults: UserDefaults = UserDefaults.standard
//////        let eventTabOrder: [Int]? = defaults.object(forKey: "tabOrder") as? [Int]
//////
//////        if eventTabOrder != nil {
//////            var dvcOrder: [UIViewController] = []
//////            for tag: Int in eventTabOrder! {
//////                for dvc in eventTabBarController.viewControllers! {
//////                    if dvc.tabBarItem.tag == tag {
//////                        dvcOrder.append(dvc)
//////                    }
//////                }
//////            }
//////            eventTabBarController.viewControllers = dvcOrder
//////            //            tabBarController.customizableViewControllers = customizableViewControllers
//////            //            print("customize: ", tabBarController.customizableViewControllers!)
//////        }
////        self.initializeInterfaceElements()
////        self.autolayoutInterfaceElements()
////
////        self.eventWindow = UIWindow()
////        self.eventWindow!.rootViewController = eventTabBarController // UINavigationController(rootViewController: VCEvents())
////        self.eventWindow!.backgroundColor = UIColor.darkGray
////        self.eventWindow!.makeKeyAndVisible()
////
////    }
////
////
////    func initializeInterfaceElements() {
//////        self.contentLabel = UILabel()
//////        self.contentLabel!.translatesAutoresizingMaskIntoConstraints = false
//////        self.view.addSubview(self.contentLabel!)
////    }
////
////
////    func autolayoutInterfaceElements() {
//////        self.contentLabel!.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//////        self.contentLabel!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
////    }
////
////}
////
////extension DVCEvent: UITabBarControllerDelegate {
////    func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
////        if changed {
////            //            print("done")
////            var eventTabOrder: [Int] = []
//////            print("viewControllers: ", viewControllers)
////            for vc: UIViewController in viewControllers {
////                eventTabOrder.append(vc.tabBarItem.tag)
////            }
////            //            print(tabOrder)
////            let eventDefaults: UserDefaults = UserDefaults.standard
////            eventDefaults.set(eventTabOrder, forKey: "tabOrder")
////        }
////    }
////}
//
