//
//  BottomSheetVC.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 26/10/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

/*****************************************************************************************/
 //       BottomSheet Dialog &  VC to Open SwitUI
/*****************************************************************************************/

import UIKit
import SwiftUI

class BottomSheetVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: nil, action: nil)

        // Do any additional setup after loading the view.
        
        // For hiding the title bar
    
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnShowBottomSheet(_ sender: Any) {
        
        //        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewVC") as? WebViewVC{
        //
        //
        //            self.navigationController?.present(vc, animated: true)
        //        }
        
        
        /*****************************************************************************************/
         //       BottomSheet Dialog
        /*****************************************************************************************/
        
        let storyboard = UIStoryboard(name: "BuisinessModule", bundle: nil)
        if let vc = storyboard.instantiateViewController(identifier: "BaicTableDemoVC") as? BaicTableDemoVC {
            
            if let sheet = vc.sheetPresentationController{
                sheet.detents = [.medium(), .large()]    // Sheetstyle
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false //Inside Scrolling
                sheet.prefersGrabberVisible = true  // Grab Button
                sheet.preferredCornerRadius = 32
            }
            self.navigationController?.present(vc, animated: true)
        }
        
        
       
        

    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    /*****************************************************************************************/
     //       VC to Open SwitUI
    /*****************************************************************************************/
    
    @IBAction func btnShowTabBarUIView(_ sender: Any) {
        
        let sView  = ContentView()
        let vc =  UIHostingController(rootView: sView)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension BottomSheetVC {
    
    static func shareInstance() -> BottomSheetVC
    {
        return BottomSheetVC.initiateFromStoryboard(name: "HomeModule")
    }
}
