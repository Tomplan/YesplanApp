//
//  TBCEvent.swift
//  YesplanApp
//
//  Created by Tom Slegers on 14/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import UIKit

class TBCEvent: UITabBarController, UITabBarControllerDelegate {

//    var objectID
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension TBCEvent {
func tabBarController(_ tabBarController: UITabBarController, didEndCustomizing viewControllers: [UIViewController], changed: Bool) {
    if changed {
        var tabOrder: [Int] = []
        for vc: UIViewController in viewControllers {
            tabOrder.append(vc.tabBarItem.tag)
        }
        
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(tabOrder, forKey: "tabOrder")
    }
}
}
