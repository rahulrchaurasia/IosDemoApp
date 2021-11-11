//
//  AddVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 03/07/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit

class AddVC: UIViewController {

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
    
    @IBAction func btnNext(_ sender: Any) {
          
        let objVC =  MoneyVC.shareInstance()
            
            navigationController?.pushViewController(objVC, animated: true)
            
        
       }

}

extension AddVC {
    
    static func shareInstance() -> AddVC
    {
        return AddVC.initiateFromStoryboard(name: "Main")
    }
}

