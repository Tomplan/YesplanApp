//
//  AppDelegate.swift
//  YesplanApp
//
//  Created by Tom Slegers on 8/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        
        UITabBar.appearance().barTintColor = UIColor.black
//        UITabBar.appearance().tintColor = UIColor.green
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.darkGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.lightGray], for: .selected)
        
        let VC01: VCEvents = VCEvents()
        VC01.tabBarItem.title = "Events"
        VC01.tabBarItem.image = UIImage(named: "Events Unselected")?.withRenderingMode(.alwaysOriginal)
        VC01.tabBarItem.selectedImage = UIImage(named: "Events Selected")?.withRenderingMode(.alwaysOriginal)
        let VC02: VCTeamplanner = VCTeamplanner()
        VC02.tabBarItem.title = "Teamplanner"
        VC02.tabBarItem.image = UIImage(named: "Teamplanner Unselected")?.withRenderingMode(.alwaysOriginal)
        VC02.tabBarItem.selectedImage = UIImage(named: "Teamplanner Selected")?.withRenderingMode(.alwaysOriginal)
        let VC03: VCResources = VCResources()
        VC03.tabBarItem.title = "Resources"
        VC03.tabBarItem.image = UIImage(named: "Resources Unselected")?.withRenderingMode(.alwaysOriginal)
        VC03.tabBarItem.selectedImage = UIImage(named: "Resources Selected")?.withRenderingMode(.alwaysOriginal)
        let VC04: VCContacts = VCContacts()
        VC04.tabBarItem.title = "Contacts"
        VC04.tabBarItem.image = UIImage(named: "Contacts Unselected")?.withRenderingMode(.alwaysOriginal)
        VC04.tabBarItem.selectedImage = UIImage(named: "Contacts Selected")?.withRenderingMode(.alwaysOriginal)
        let VC05: VCTasks = VCTasks()
        VC05.tabBarItem.title = "Tasks"
        VC05.tabBarItem.image = UIImage(named: "Tasks Unselected")?.withRenderingMode(.alwaysOriginal)
        VC05.tabBarItem.selectedImage = UIImage(named: "Tasks Selected")?.withRenderingMode(.alwaysOriginal)
        let VC06: VCReports = VCReports()
        VC06.tabBarItem.title = "Reports"
        VC06.tabBarItem.image = UIImage(named: "Reports Unselected")?.withRenderingMode(.alwaysOriginal)
        VC06.tabBarItem.selectedImage = UIImage(named: "Reports Selected")?.withRenderingMode(.alwaysOriginal)
        let VC07: VCHelp = VCHelp()
        VC07.tabBarItem.title = "Help"
        VC07.tabBarItem.image = UIImage(named: "Help Unselected")?.withRenderingMode(.alwaysOriginal)
        VC07.tabBarItem.selectedImage = UIImage(named: "Help Selected")?.withRenderingMode(.alwaysOriginal)
        let VC08: VCSearch = VCSearch()
        VC08.tabBarItem.title = "Search"
        VC08.tabBarItem.image = UIImage(named: "Search Unselected")?.withRenderingMode(.alwaysOriginal)
        VC08.tabBarItem.selectedImage = UIImage(named: "Search Selected")?.withRenderingMode(.alwaysOriginal)
        let VC09: VCUser = VCUser()
        VC09.tabBarItem.title = "User"
        VC09.tabBarItem.image = UIImage(named: "User Unselected")?.withRenderingMode(.alwaysOriginal)
        VC09.tabBarItem.selectedImage = UIImage(named: "User Selected")?.withRenderingMode(.alwaysOriginal)
        // max allowed viewcontrollers = 11?
        let VC10: VCTodo = VCTodo()
        VC10.tabBarItem.title = "Todo"
        VC10.tabBarItem.image = UIImage(named: "To Do Unselected")?.withRenderingMode(.alwaysOriginal)
        VC10.tabBarItem.selectedImage = UIImage(named: "To Do Selected")?.withRenderingMode(.alwaysOriginal)
        let VC11: VCConflicts = VCConflicts()
        VC11.tabBarItem.title = "Conflicts"
        VC11.tabBarItem.image = UIImage(named: "Conflicts Unselected")?.withRenderingMode(.alwaysOriginal)
        VC11.tabBarItem.selectedImage = UIImage(named: "Conflicts Selected")?.withRenderingMode(.alwaysOriginal)
        let VC12: VCUpdates = VCUpdates()
        VC12.tabBarItem.title = "Updates"
        VC12.tabBarItem.image = UIImage(named: "Updates Unselected")?.withRenderingMode(.alwaysOriginal)
        VC12.tabBarItem.selectedImage = UIImage(named: "Updates Selected")?.withRenderingMode(.alwaysOriginal)
        
        let tabBarController: UITabBarController = UITabBarController()
        let controllers = [VC01, VC02, VC03, VC04, VC05, VC06, VC07, VC08, VC09, VC10, VC11, VC12]
//        tabBarController.setViewControllers(controllers, animated: false)
        tabBarController.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
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
        
        tabBarController.delegate = self
        

        if tabBarController.viewControllers != nil {
//            print(tabBarController.viewControllers!)
            for i in 0 ..< tabBarController.viewControllers!.count {
                let vc: UIViewController = tabBarController.viewControllers![i]
                vc.tabBarItem.tag = i
//                customizableViewControllers.append(vc)
            }
        }
        
        if tabBarController.viewControllers != nil {
//            print(tabBarController.viewControllers!)
        }

        let defaults: UserDefaults = UserDefaults.standard
        
//        print(defaults.object(forKey: "tabOrder"))
//        var tabOrder: [Int]? = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
//        print(tabOrder)
//
//        defaults.set(tabOrder, forKey: "tabOrder")
       let tabOrder: [Int]? = defaults.object(forKey: "tabOrder") as? [Int]

        if tabOrder != nil {
            var vcOrder: [UIViewController] = []
            for tag: Int in tabOrder! {
                for vc in tabBarController.viewControllers! {
                    if vc.tabBarItem.tag == tag {
                        vcOrder.append(vc)
                    }
                }
            }
            tabBarController.viewControllers = vcOrder
//            tabBarController.customizableViewControllers = customizableViewControllers
//            print("customize: ", tabBarController.customizableViewControllers!)
        }
        
        self.window = UIWindow()
        self.window!.rootViewController = tabBarController // UINavigationController(rootViewController: VCEvents())
        self.window!.backgroundColor = UIColor.darkGray
        self.window!.makeKeyAndVisible()

        return true
    }

    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
        if changed {
//            print("done")
            var tabOrder: [Int] = []
//            print("viewControllers: ", viewControllers)
            for vc: UIViewController in viewControllers {
                tabOrder.append(vc.tabBarItem.tag)
            }
//            print(tabOrder)
            let defaults: UserDefaults = UserDefaults.standard
            defaults.set(tabOrder, forKey: "tabOrder")
        }
    }
}

