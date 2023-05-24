//
//  AppDelegate.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 27/02/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // Note : We delted ths Scen delegate
    // In inofo.plist : remove : Application Scence manifest
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Note :  Used For Keyboard Handling When its hiding the textfield
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        
        // Added :-- RootView
    
        Switcher.updateRootVC()
        
        /*
         /// Commented Started //////////
       // let VC : UIViewController?
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if (Defaults.isLogin()) {
            
            // VC = HomeVC.shareInstance()
            
            
            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            window?.rootViewController = mainTabBarController
            
        }else{
            
            // VC = LoginVC.shareInstance()
            let loginNavController = storyboard.instantiateViewController(identifier: "LoginVC")
            window?.rootViewController = loginNavController
        }
        
        window?.makeKeyAndVisible()
         //// comment End ///////////
        */
        return true
        
        
        
    }
    
    
    
    
}

