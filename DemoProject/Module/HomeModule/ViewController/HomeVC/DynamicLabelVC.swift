//
//  DynamicLabelVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 11/12/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

//https://agrawalsuneet.github.io/blogs/uiview-clicklistener-swift/
import UIKit

class DynamicLabelVC: UIViewController {
    
    @IBOutlet weak var headerView1: UIStackView!
    
    @IBOutlet weak var headerView2: UIStackView!
    
    
    @IBOutlet weak var headerView3: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
        
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
        
        let gesture3 = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
    
        self.headerView1.addGestureRecognizer(gesture1)
        self.headerView2.addGestureRecognizer(gesture2)
        self.headerView3.addGestureRecognizer(gesture3)
        
    }
    
    
    @objc func clickAction(sender : UITapGestureRecognizer) {
        
      
        switch sender.view {
          case headerView1:
              print("tapped Image View 1") //add your actions here
            let objVC = ScrollDemoVC.shareInstance()
             
            navigationController?.pushViewController(objVC, animated: true)
          case headerView2:
              print("tapped Image View 2") //add your actions here
              showAlert(message: "tapped Header View 2")
          case headerView3:
            showAlert(message: "tapped Header View 3")
              print("tapped Image View 3") //add your actions here
          default:
              print("Tap not detected")
          
           
          }
        
       
        
    }

  

}


extension DynamicLabelVC {
    
    static func shareInstance() -> DynamicLabelVC
    {
        return DynamicLabelVC.initiateFromStoryboard(name: "HomeModule")
    }
}
