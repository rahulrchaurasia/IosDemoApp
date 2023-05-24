//
//  SlideMenuVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 24/03/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit

class SlideMenuVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblVersion: UILabel!
    
    @IBOutlet weak var slideTableView: UITableView!
    
    
    var menuSectionList =  MenuDb.shareInstance.getMenuSection()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
         setHeader()
    }
    
    func setHeader(){

//        if let userData = UserDefaults.standard.object(forKey: Defaults.userDataKey) as? Data {
//            let decoder = JSONDecoder()
//            if let loginEntity = try? decoder.decode(Userdetail.self, from: userData) {
//                print(loginEntity.name)
//
//                lblName.text = loginEntity.name
//                lblVersion.text = UIApplication.appVersion     // created extension
//            }
//        }
        
        let loginEntity : Userdetail?  =  Defaults.getLoginEntity()
            
              lblName.text = loginEntity?.name ?? ""
        let activationCode =  loginEntity?.activation_code ?? "8"
        lblVersion.text = UIApplication.appVersion! +  activationCode
        
        slideTableView.sectionHeaderTopPadding  = 5
        
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
       
         print("MENU COUNT \(menuSectionList.count) ")
        return menuSectionList.count
        
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if(menuSectionList[section].isExpanded == true){
            
            return menuSectionList[section].menuModel.count
            
        }else{
            return 0
        }
    // old :    if(section == 0) {...} else  if (section == 1) {..}
   
        
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : SideMenuTableViewCell =
            tableView.dequeueReusableCell(withIdentifier: "cell") as! SideMenuTableViewCell
        
        
       // Note :indexPath.section for Header and indexPath.row is for body
        //if no multiple heder than by default single section
        
        cell.configureCell(menu: menuSectionList[indexPath.section].menuModel[indexPath.row])
        cell.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.8195264935, green: 0.8196648955, blue: 0.8195083141, alpha: 0.5))
        
        
        // For refrence :
        
//        if(indexPath.section == 0)
//        {
//
//            cell.configureCell(menu: menuSectionList[i0].menuModel[indexPath.row])
//            cell.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.8195264935, green: 0.8196648955, blue: 0.8195083141, alpha: 0.5))
//
//        }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch menuSectionList[indexPath.section].menuModel[indexPath.row].mId
        {
        
        case 2 :
            
            let objVC =  DynamicLabelVC.shareInstance()
                
            navigationController?.pushViewController(objVC, animated: true)
            
        case 3 :
            
               
            navigationController?.pushViewController( CommonWebVC.shareInstance(), animated: true)
            
            
        case 4 :
            
              
            navigationController?.pushViewController(WebViewVC.shareInstance(), animated: true)
            
        case 5 :
            
              
            navigationController?.pushViewController(BottomSheetVC.shareInstance(), animated: true)
            
        case 6 :
             
            navigationController?.pushViewController(ExpandableTableVC.shareInstance(), animated: true)
            
        case 7 :
             
            navigationController?.pushViewController(NestedTableViewVC.shareInstance(), animated: true)
          
        case 8 :
             
            navigationController?.pushViewController(ContactDetailsVC.shareInstance(), animated: true)
          
            
        case 101 :
            
          
            navigationController?.pushViewController(BaicTableDemoVC.shareInstance(), animated: true)
            
        
        case 102 :
            
            navigationController?.pushViewController(ScrollViewDemoVC2.shareInstance(), animated: true)
            
        case 103 :
            
            navigationController?.pushViewController(ScrollWithTableVC.shareInstance(), animated: true)
            
        case 104 :
            
            navigationController?.pushViewController(DemoLoginVC.shareInstance(), animated: true)
            
        case 205 :
            
            showConfirmAlert (AlertTitle : "FoodCorner", AlertMessage: getMessage.logoutMessage)
       
        
      
        default:
            print("Default")
        }
    }
    
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //let headerView:UIView =  UIView()
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        /**************************** VVIP **************************************/
        // for Color : https://www.youtube.com/watch?v=pqnLevvM7Rs
        // write (cgColor: than "Color Literal"  )
        /******************************************************************/
        
        // headerView.backgroundColor = UIColor.gray
        headerView.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        
        
        let headerChildView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: headerView.frame.width, height: headerView.frame.height-0.6))
        headerChildView.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        let label = UILabel()
        //label.frame = CGRect.init(x: 10, y: 10, width: 200, height: 30)
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.font = .systemFont(ofSize: 16)
        label.textColor = .red
        
        let imageView = UIImageView()
        //drop_down_arrow
        imageView.image = UIImage(named: "drop_down_arrow")
        imageView.frame = CGRect.init(x: 250, y: 12, width: 25, height: 25)
        
        
        label.text = menuSectionList[section].section
        
        
        //        label.font = UIFont().futuraPTMediumFont(16) // my custom font
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        //        label.textColor = UIColor.charcolBlackColour() // my custom colour
        label.textColor = UIColor.white
        
        
        // Note :UITapGestureRecognizer  gesture effect , function headerTapped(_:) we have to implement
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(headerTapped(_:)))
        headerView.tag = section
        headerView.addGestureRecognizer(tapGestureRecognizer)
        
        headerView.addSubview(headerChildView)
        headerView.addSubview(imageView)
        headerView.addSubview(label)
        
        
        
        return headerView
        
    }
    
    @objc func headerTapped(_ sender: UITapGestureRecognizer?) {
        
        guard let section = sender?.view?.tag else { return }
        
        
        
        
        if(menuSectionList[section].isExpanded ){
            
            menuSectionList[section].isExpanded = false
        }else{
            menuSectionList[section].isExpanded = true
        }
        
        
        DispatchQueue.main.async {
            self.slideTableView.reloadData()
            
        }
        
        // Use your section index here
        // ...
    }
    
    
  
    
    
    
    func showConfirmAlert(AlertTitle:String, AlertMessage:String) {
            
           
        
        let refreshAlert = UIAlertController(title: AlertTitle, message: AlertMessage, preferredStyle: UIAlertController.Style.alert)

        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              print("Handle Ok logic here")
            self.snackBar(message: "Handle Ok logic here")
           self.logout()
            
            
        }))

        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
              print("Handle Cancel Logic here")
              
        }))

        present(refreshAlert, animated: true, completion: nil)
        
       
    }
    
    func logout(){
        
        Defaults.clearUserData()
        
        Switcher.updateRootVC()
        
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let LoginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC")  as? LoginVC
//        LoginVC!.modalPresentationStyle = .fullScreen
//        LoginVC!.modalTransitionStyle = .coverVertical
//
//        navigationController?.pushViewController(LoginVC!, animated: true)
//
        
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
       // self.presentingViewController?.dismiss(animated: false, completion: nil)
        
        //self.navigationController?.popViewController(animated: false)
       // self.navigationController?.popToRootViewController(animated: false)
       
//        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//        self.window?.rootViewController = loginVC
//        self.window?.makeKeyAndVisible()
        
        
     
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        appDelegate?.window?.rootViewController = LoginVC


        
//        let rootVC =  UIApplication.shared.windows.first?.rootViewController
//        if let topVC = UIApplication.getTopViewController() {
//
//            if(rootVC is HomeVC){
//
//                topVC.navigationController?.pushViewController(LoginVC.shareInstance(), animated: true)
//            }else{
//
//                topVC.navigationController?.popToRootViewController(animated: true)
//                // topVC.navigationController?.pushViewController(LoginVC.shareInstance(), animated: true)
//            }
//
//        }
    }
      
    
}
