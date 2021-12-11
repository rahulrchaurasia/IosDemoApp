//
//  TableViewDemoVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 08/12/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit

class TableViewDemoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    

}

extension TableViewDemoVC {
    
    static func shareInstance() -> TableViewDemoVC
    {
        return TableViewDemoVC.initiateFromStoryboard(name: "BuisinessModule")
    }
}
