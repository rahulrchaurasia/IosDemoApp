//
//  LoginVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 27/02/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.




import UIKit

import SVProgressHUD

/*
 Note  : We Use navigationController?.pushViewController
 two ways 1> pushViewController  2> Present
 
 For hiding the title bar :
 navigationController?.setNavigationBarHidden(true, animated: false) 
 
 Completion Handler :-
 Link : https://www.youtube.com/watch?v=1K7Ip2f0lKg
 */

class LoginVC: UIViewController, UITextFieldDelegate {
    
    
    
    
    @IBOutlet weak var txtUserID: UITextField!
    
    @IBOutlet weak var txtUserPassword: UITextField!
    
    @IBOutlet weak var brnEye: UIButton!
    
    var iconClick = true
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Important
        navigationController?.setNavigationBarHidden(true, animated: false)  // For hiding the title bar
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        // For Showing title in Another ViewController
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        txtUserID.delegate = self
        txtUserPassword.delegate = self
        
        txtUserPassword.isSecureTextEntry = true   // for password secure key
        
        
        
        // Do any additional setup after loading the view.x x
        
        
        //Mark : Comment
        //                nonescaping { (value) in
        //                    print(value)
        //                }
        //                 print("Next Line ")
        //
        //
        //
        //
        //        /*********************************************/
        //                escaping { (value) in
        //                    print(value)
        //                }
        //                print("EScaping Next Line ")
        
        /*********************************************/
        
        
        
        //        doSomething(str: "Hello") { (isBool, compStr) in
        //            if(isBool){
        //
        //                print("\( compStr!)  Successfully result")
        //            }else{
        //                print("\(compStr ?? "yyy") Failed")
        //            }
        //        }
        
        
        
        
        /*****************    imp   ****************************/
        
        resultDemo { (result) in
            
            switch result {
                
            case .success(let str):
                
                print("Start from here \(str)")
                
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
        
        
        
        
        
        
    }
    
    
    
    @IBAction func btnSignClick(_ sender: Any) {
        
        
        
        if(loginValidate()){
            
            self.hideKeyboardWhenTappedAround()
            getSignInApi()
        }
        
    }
    
    
    
    func getSignInApi(){
        
        if( Connectivity.isConnectedToInternet() == false){
            
            snackBar(message: Connectivity.message)
            
        }else{
            
            
            
            self.showDialog(strTitle: "Please Wait!!")
            
            let device_id = ""
            let device_token = ""
            let user_type_id = "1"
            
            let a = login_url
            print(a)
            
            let loginModel = LoginModel(mobile: txtUserID.text! ,password: txtUserPassword.text!, device_id: device_id, device_token: device_token, user_type_id: user_type_id)
            
            
            
            APILoginManger.shareInstance.loginAPI(login: loginModel) { (result ) in
                
                switch result {
                    
                case .success(let json):
                    print("Got Result successfully....")
                    
                    let LoginRespData = json as! LoginResponse
                    let loginEntity = LoginRespData.data[0].userdetails![0]
                    // self.showAlert(message: "Login Successfully..\(loginEntity.name + loginEntity.email)")
                    print("Login Successfully..\(loginEntity.name + loginEntity.email)")
                    
                    self.dismissDialog()
                    
                    //                    let homeViewTabBar = self.storyboard?.instantiateViewController(withIdentifier: "HomeVCTabBar") as? UITabBarController
                    //                    self.view.window?.rootViewController = homeViewTabBar
                    //                    self.view.window?.makeKeyAndVisible()
                    
                    
                    
//                    let homeViewTabBar = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
                    //self.navigationController?.pushViewController(homeViewTabBar , animated: true)
                   
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController") as! UITabBarController
                    mainTabBarController.modalPresentationStyle = .fullScreen
                    

                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController = mainTabBarController
                    appDelegate.window?.makeKeyAndVisible()


                
                case .failure(.custom(message: let error)):
                    self.dismissDialog()
                    self.showAlert(message:error)
                }
            }
            
        }
    }
    
    
    func loginValidate()  -> Bool {
        
        if( txtUserID.text!.trimmingCharacters(in: .whitespaces).isEmpty){
            self.snackBar(message: "Enter Valid Email/User Id")
            return false
        }
        
        if( txtUserPassword.text!.trimmingCharacters(in: .whitespaces).isEmpty){
            self.snackBar(message: "Enter Password")
            return false
        }
        
        
        
        return true
    }
    
    
    
    
    @IBAction func btnEyeClick(_ sender: Any) {
        
        if(iconClick == true) {
            txtUserPassword.isSecureTextEntry = false
            let img = UIImage(named: "ic_password_visible")
            brnEye.setImage(img , for: .normal)
            
        } else {
            txtUserPassword.isSecureTextEntry = true
            let img = UIImage(named: "ic_password_invisible.png")
            brnEye.setImage(img , for: .normal)
        }
        
        iconClick = !iconClick
        
    }
    
    
    
    
    
    
    
    // Mark :Practice
    /****************** Practice  ****************************************/
    
    func nonescaping(completion : (String)-> Void) {
        
        print("function start")
        completion("Completion Called")
        print("function ended")
        
    }
    
    func escaping(nicompletion : @escaping(String)-> Void) {
        
        print("function start")
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5.0) {
            nicompletion("Completion Called")
        }
        
        print("function ended")
        
    }
    
    func doSomething(str : String , completion : (Bool,String?)-> Void){
        
        print("Do Something function start")
        
        completion(true,str)
        
    }
    
    
    func resultDemo(completion : (Result<String,Error>) -> Void) {
        
        print("ResultDemo function start")
        
        completion(.success("Data Save Successfully......"))
    }
    
    
    
    /***************** End Practice  ************************************/
    
    
    
    
}

extension LoginVC {
    
    static func shareInstance() -> LoginVC
    {
        return LoginVC.initiateFromStoryboard(name: "Main")
    }
}

