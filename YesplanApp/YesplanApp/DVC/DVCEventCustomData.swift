//
//  DVCEventCustomData.swift
//  YesplanApp
//
//  Created by Tom Slegers on 19/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import UIKit

class DVCEventCustomData: UIViewController {

    var CustomDataText: String?
    var CustomDataText2: String?
    
    @IBOutlet weak var LblCustomData: UILabel!
    @IBOutlet weak var TxtCustomData: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if CustomDataText != nil {
            self.LblCustomData.text =
            CustomDataText
        }
        if CustomDataText2 != nil {
            self.TxtCustomData.text =
            CustomDataText2
        }
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
