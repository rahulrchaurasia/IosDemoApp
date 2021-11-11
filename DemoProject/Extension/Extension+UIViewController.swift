//
//  Extension+UIViewController.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 20/03/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
import TTGSnackbar




extension UIViewController {
    

    //-------< For Hide Keyboard >--------
    // Mark : Put this piece of code anywhere you like
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
   
    
    class func initiateFromStoryboard(name : String) -> Self
    {
        return initiateFromStoryboardHelper(name)
    }
    
    fileprivate class func initiateFromStoryboardHelper<T>(_ name : String) -> T {
        
        let storyboard = UIStoryboard(name: name, bundle: nil)
        
        let controller = storyboard.instantiateViewController(identifier: "\(Self.self)") as!  T
        
        return controller
    }
    
    
    func showAlert(message:String)
    {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
      
        // Move to the UI thread
        DispatchQueue.main.async(execute: { () -> Void in
            // Present Alert Controller
              self.present(alert, animated: true, completion: nil)
        })
    }
    
    func showAlert(_ AlertTitle:String, AlertMessage:String, AlertTag:NSInteger) {
          
          // Initialize Alert Controller
          let alertController = UIAlertController(title: AlertTitle, message: AlertMessage, preferredStyle: .alert)
          
          // Initialize Actions
          let OkAction = UIAlertAction(title: "Ok", style: .default) { (action) -> Void in
              
          }
          //Add Actions
          alertController.addAction(OkAction)
          
          // Move to the UI thread
          DispatchQueue.main.async(execute: { () -> Void in
              // Present Alert Controller
              self.present(alertController, animated: true, completion: nil)
          })
          
      }
    
    func snackBar(message : String){
        
        let snackbar = TTGSnackbar(
            message: message,
            duration: .middle,
            actionText: "OK",
            
            actionBlock: { (snackbar) in
                print("Click action!")
            }
        )
        //appIcon
        snackbar.icon = UIImage(named: "info_icon")
        snackbar.show()
    }
     
    func showDialog(){
        
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setBackgroundLayerColor(customBlackTransparent)
        SVProgressHUD.setForegroundColor(customPrimaryColor)
        SVProgressHUD.show()
    }
    
    func showDialog(strTitle : String){
        
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setBackgroundLayerColor(customBlackTransparent)
        SVProgressHUD.setForegroundColor(customPrimaryColor)
        SVProgressHUD.show(withStatus: strTitle)
    }
    
    
    func dismissDialog(){
        
        SVProgressHUD.dismiss()
    }
    
    func dismissAll(animated: Bool, completion: (() -> Void)? = nil) {
        if let optionalWindow = UIApplication.shared.delegate?.window, let window = optionalWindow, let rootViewController = window.rootViewController, let presentedViewController = rootViewController.presentedViewController  {
            if let snapshotView = window.snapshotView(afterScreenUpdates: false) {
                presentedViewController.view.addSubview(snapshotView)
                presentedViewController.modalTransitionStyle = .coverVertical
            }
            if !isBeingDismissed {
                rootViewController.dismiss(animated: animated, completion: completion)
            }
        }
    }
    
}

