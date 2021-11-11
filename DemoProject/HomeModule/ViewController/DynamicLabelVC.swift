//
//  DynamicLabelVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 06/10/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit

class DynamicLabelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DynamicLabelVC {
    
    static func shareInstance() -> DynamicLabelVC
    {
        return DynamicLabelVC.initiateFromStoryboard(name: "HomeModule")
    }
}
