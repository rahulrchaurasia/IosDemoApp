//
//  DynamicLabelVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 06/10/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

/*

 UIView dynamic height depending on Label Height :---
https://stackoverflow.com/questions/39410796/uiview-dynamic-height-depending-on-label-height
 
 
 
 Note : For Scrollview  :
 if scrollview content is more : we can set ◺ Simulated size : freedom and set required height
  Case 1> set Container width equal to scrollview and give heght = required height
 
 case 2 > set Container width equal to scrollview  and height constrain also
          equal to scrollview but low priority ie 250
 */
import UIKit

class DynamicLabelVC: UIViewController {

    @IBOutlet weak var Header1View: UIStackView!
    @IBOutlet weak var Header2View: UIStackView!
    @IBOutlet weak var Header3View: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //swift code in view controller

        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
        self.Header1View.addGestureRecognizer(gesture)

       

    }
    

    @objc func clickAction(sender : UITapGestureRecognizer) {
       
        
        let objVC =  ScrollDemoVC.shareInstance()
            
        navigationController?.pushViewController(objVC, animated: true)
    }

}

extension DynamicLabelVC {
    
    static func shareInstance() -> DynamicLabelVC
    {
        return DynamicLabelVC.initiateFromStoryboard(name: "HomeModule")
    }
}
