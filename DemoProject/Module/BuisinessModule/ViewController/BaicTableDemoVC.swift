//
//  BaicTableDemoVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 21/12/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

/*
 Note :
 1>
 basicTableView.delegate = self
 basicTableView.dataSource = self
 
 Or we can add it by click on tableview and drag it to UIVIEW and add delegate and dataSource
 
 2> Adding Tableview
  - so Add tableView (mostly constrain 0,0,0,0) in UI and then set prototype (eg 1).
  - View inside the tableview : set its identifier (eg. cell) and also set its class name (eg BasicTableViewCell) which is the UIViewController cell class (who handling the tableView widget ie label , button etc).
      in our scenario cell class is BasicTableViewCell.
 
 */
import UIKit

/*
Note : In UI  AppBar XIB added for  Handling Navigation Title custom
 
 */

class BaicTableDemoVC: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var appBar: AppBarView!
    
   
    @IBOutlet weak var basicTableView: UITableView!
    
    var items = ["Item 1", "Item2", "Item3", "Item4",
                 "Item 5", "Item6", "Item7", "Item8",
                 "Item 9", "Item10", "Item11", "Item12"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        basicTableView.delegate = self
        basicTableView.dataSource = self
        
        // AppBar Using Code
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        appBar.lblTitle.text =  "Basic Table Demo"
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
        
        self.appBar.btnBack.addGestureRecognizer(gesture)
    }
    
    @objc func clickAction(sender : UITapGestureRecognizer) {
        
      
        switch sender.view {
          case appBar.btnBack:
              print("tapped Image View 1") //add your actions here
              navigationController?.popViewController(animated: true)
    
          default:
              print("Tap not detected")
          
           
          }
        
       
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell  =  basicTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BasicTableViewCell

        cell.lblDemo.text = items[indexPath.row]
        cell.lblProduct.text = "Product \(indexPath.row + 1)"

        return cell
    }
    
  
}

extension BaicTableDemoVC {
    
    static func shareInstance() -> BaicTableDemoVC
    {
        return BaicTableDemoVC.initiateFromStoryboard(name: storyBoardName.BuisinessModule)
    }
}
