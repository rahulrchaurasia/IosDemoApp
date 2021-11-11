//
//  Switcher.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 15/07/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import Foundation
import UIKit

// Link :---  https://paulallies.medium.com/ios-swift4-login-logout-branching-4cdbc1f51e2c 
class Switcher {
    
    static func updateRootVC(){
        
        let status = Defaults.isLogin()
        var rootVC : UIViewController?
       
            print(status)
        

        if(status == true){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarController") 
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        }
        
  
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        appDelegate.window?.makeKeyAndVisible()
        
    }
    
}
