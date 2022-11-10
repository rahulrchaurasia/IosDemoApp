//
//  TabBarMainHome.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 31/10/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import UIKit

class TabBarMainHome:  UITabBarController, UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("Main Tab bar loaded")
        self.delegate = self
  
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected Tabar")
       
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
       
        if viewController.isKind(of: MoneyVC.self) {
//             let vc =  TabTwoViewController()
//             vc.modalPresentationStyle = .overFullScreen
//             self.present(vc, animated: true, completion: nil)
//             return false
            
            showBottomSheetDialog()
            return false
          }
          return true
       
    }
    
    func showBottomSheetDialog(){
        
        
        /*****************************************************************************************/
         //       BottomSheet Dialog
        /*****************************************************************************************/
        
        //let navigationController = UINavigationController(rootViewController: UIViewController());

        let storyboard = UIStoryboard(name: "BuisinessModule", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "BaicTableDemoVC") as? BaicTableDemoVC
            
        {
            
            if let sheet = vc.sheetPresentationController{
                sheet.detents = [.medium(), .large()]    // Sheetstyle
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false //Inside Scrolling
                sheet.prefersGrabberVisible = true  // Grab Button
                sheet.preferredCornerRadius = 32
            }
           // self.navigationController?.present(vc, animated: true)
            
           present(vc, animated: true)
        }
        
    }

}
