//
//  CustomVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 04/07/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit

class CustomVC: UIViewController {
    
    
    
    @IBOutlet weak var testView: TestVew!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        //testView.lblLabel.text = "Menu Xib"

        
        let tapGestureRecognize = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer: )))
        testView.ImgBack.isUserInteractionEnabled = true
        testView.ImgBack.addGestureRecognizer(tapGestureRecognize)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
       // let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
extension CustomVC {
    
    static func shareInstance() -> CustomVC
    {
        return CustomVC.initiateFromStoryboard(name: "custom")
    }
}



