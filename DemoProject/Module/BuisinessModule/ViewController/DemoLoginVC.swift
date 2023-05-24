//
//  DemoLoginVC.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 22/05/23.
//  Copyright © 2023 Nilesh Birhade. All rights reserved.
//

import UIKit

class DemoLoginVC: UIViewController {

    @IBOutlet weak var mainCardView: UIView!
    
    @IBOutlet weak var loginID: UITextField!
    
    @IBOutlet weak var loginPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBlue//
        self.mainCardView.layer.cornerRadius = 20.0
        //self.mainCardView.clipToBounds = true
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Login"
        self.navigationItem.largeTitleDisplayMode = .never
        
        //Important
        navigationController?.setNavigationBarHidden(true, animated: false)  // For hiding the title bar
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

extension DemoLoginVC {
   
    static func shareInstance() -> DemoLoginVC
    {
        return DemoLoginVC.initiateFromStoryboard(name: storyBoardName.BuisinessModule)
    }
    
   
    
    
  
}
