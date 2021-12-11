//
//  DynamicLabelVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 11/12/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit

class DynamicLabelVC: UIViewController {
    
    @IBOutlet weak var headerView1: UIStackView!
    
    @IBOutlet weak var headerView2: UIStackView!
    
    
    @IBOutlet weak var headerView3: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
        self.headerView1.addGestureRecognizer(gesture)
        
    }
    
    
    @objc func clickAction(sender : UITapGestureRecognizer) {
        
        let objVC = ScrollDemoVC.shareInstance()
         
        navigationController?.pushViewController(objVC, animated: true)
        
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
