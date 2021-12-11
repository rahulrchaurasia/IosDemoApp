//
//  ScrollDemoVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 10/12/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit

class ScrollDemoVC: UIViewController {

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

extension ScrollDemoVC {
    
    static func shareInstance() -> ScrollDemoVC
    {
        return ScrollDemoVC.initiateFromStoryboard(name: "HomeModule")
    }
}
