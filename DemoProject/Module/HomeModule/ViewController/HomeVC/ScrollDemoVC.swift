//
//  ScrollDemoVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 10/12/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//
//https://stackoverflow.com/questions/52003086/uibutton-action-is-not-triggered-after-constraint-layouts-changed

     //*******************  {A} Scroollview / Clip to bound  ***************************//
// {A} Scroollview : container height and width  equal to scrollview. but container height set to low priority ie 250

/*
 Note : Use "Clip to bound" property in parent view ie containerview or other parentview
 
 case : Bank info : default height > 0 and height showing in property around 200 which will connect upto label 'Upload Transfer recipt' hence below its ui is displaying but not clickable. ie why my button not tapped those are below 'upload Transfer receipt'.
 
 soln : After applying Clip to bound to CHECK on view "Bank info" we found that storyboard showing exact display at height 200 rest below ui not visible hence we have to increase the height accordingly.
 
 
 /**********************************************************************
 To make situation more clear do one more thing, set clipToBound property of contentview to true.
 you will notice that after loading of data your button not fully visible, it means it is shifting out of bound of its parentView (ContentView)
 And that's why button is not taking your touch. However, if you carefully touch upper part of button it still do its job. Because upper part is still in bound of ContentView
 Solution : After loading of data you have to make sure that you increase height of ContentView such that button should never go out of bound of its parentView(ContentView).

  *****************************************************************/

 
 //*******************  ScrollView.layoutIfNeeded()  ***************************//
 
  your view requires layout for whatever reason (e.g. you called setNeedsLayout when handling some user action). Then, your custom layoutSubviews method will be called immediately instead of when it would normally
 
 case : on button Apply click, botttom view will be added at the end of scrollview . but scrollToBottom  not working properly . hence we used  ScrollView.layoutIfNeeded()
 
 */
import UIKit

class ScrollDemoVC: UIViewController , UITextFieldDelegate{
    
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var OrderBottomView: UIStackView!
    
    @IBOutlet weak var OrderBottomHeightConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var tfCouponCode: UITextField!
    
    var isScrolledBottom : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "ScrollView Demo 1"
        initData()
       
    }
    
    func initData(){
        
        self.OrderBottomView.isHidden = true
        self.OrderBottomHeightConstrain.constant = 0
        
        hideKeyboardWhenTappedAround()
        
        tfCouponCode.delegate = self
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   
    func validate()  -> Bool {
        
        if( tfCouponCode.text!.trimmingCharacters(in: .whitespaces).isEmpty){
            self.snackBar(message: "Enter Coupon Code")
            return false
        }
        
        else if( tfCouponCode.text!.trimmingCharacters(in: .whitespaces).count < 6){
            self.snackBar(message: "Enter Valid Coupon Code")
            return false
        }
        
        
        
        return true
    }
    
    //Mark : ScrollView set To bottom
    
    @IBAction func btnApply(_ sender: Any) {
        
        
        if(validate()) {
            
            // showAlert(message: "Apply is Click")
            
            if(!isScrolledBottom){
                
                isScrolledBottom = true
                
                self.OrderBottomView.isHidden = false
                self.OrderBottomHeightConstrain.constant = 50
               
                mainScrollView.layoutIfNeeded()
               
                self.mainScrollView.scrollToBottom(animated: true)
            }else{
                
                self.mainScrollView.scrollToBottom(animated: true)
            }
            
        }
        
        
    }
    
   
    @IBAction func btnOrderUpload(_ sender: Any) {
        
      //  print(" btnApply is Click")
        showAlert(message: "Upload is Click")
       
    }
    
    
    @IBAction func btnSubmit(_ sender: Any) {
        
        showAlert(message: "Hide the Bottom")
        isScrolledBottom = false
        tfCouponCode.text = ""
        self.OrderBottomView.isHidden = true
        self.OrderBottomHeightConstrain.constant = 0
       
       
    }
  
    @IBAction func btnPayOnlineTapped(_ sender: Any) {
        
      //  print(" btnApply is Click")
       // showAlert(message: "Online is Click")
        
        let objVC = ScrollViewDemoVC2.shareInstance()
        
        navigationController?.pushViewController(objVC, animated: true)
       
    }
   
    
    
}

extension ScrollDemoVC {
    
    static func shareInstance() -> ScrollDemoVC
    {
        return ScrollDemoVC.initiateFromStoryboard(name: storyBoardName.HomeModule)
    }
}
