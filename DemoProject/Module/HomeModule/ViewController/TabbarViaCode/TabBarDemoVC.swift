//
//  TabBarDemoVC.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 29/10/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import UIKit

// refrence : https://www.appsdeveloperblog.com/create-uitabbarcontroller-programmatically/


class TabBarDemoVC:  UITabBarController, UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        //Assign self for delegate for that ViewController can respond to UITabBarControllerDelegate methods
              self.delegate = self
    }
    
    @IBAction func btnBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Create Tab one
            let tabOne = TabOneViewController()
            let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
            
            tabOne.tabBarItem = tabOneBarItem
            
            
            // Create Tab two
            let tabTwo = TabTwoViewController()
            let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
            
            tabTwo.tabBarItem = tabTwoBarItem2
        
            // Create Tab three
            let tabthree = TabThreeViewController()
            let tabThreeBarItem = UITabBarItem(title: "Tab 3", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage.png"))
            
            tabthree.tabBarItem = tabThreeBarItem
            
            
            self.viewControllers = [tabOne, tabTwo,tabthree]
        }
        
        // UITabBarControllerDelegate method
        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            print("Selected \(viewController.title!)")
            
            
        }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
       
        if viewController.isKind(of: TabThreeViewController.self) {
//             let vc =  TabTwoViewController()
//             vc.modalPresentationStyle = .overFullScreen
//             self.present(vc, animated: true, completion: nil)
//             return false
            
            showAlert(message: "Hello")
            return false
          }
          return true
       
    }
    

}


extension TabBarDemoVC {
    
    static func shareInstance() -> TabBarDemoVC
    {
        return TabBarDemoVC.initiateFromStoryboard(name: "HomeModule")
    }
}


import UIKit
class TabOneViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.systemYellow
        self.title = "Tab 1"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}

import UIKit
class TabTwoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.lightGray
        self.title = "Tab 2"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

import UIKit
class TabThreeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.lightGray
        self.title = "Tab 3"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
