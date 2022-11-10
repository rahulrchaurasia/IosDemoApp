//
//  ScrollViewDemoVC2.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 14/12/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//
/*
        
 https://www.youtube.com/watch?v=INkeINPZddo
 
 
 ******************For Scrollview : *****************************
 
   https://www.youtube.com/watch?v=_Qn3UGad3lg&t=41s
 *****************************************************************
 
 Note : TableView Inside ScrollView :
 
 1> we have to give height to Our table View Other wise it will not display
 
 2> or we have to set height of tableview according with scroolview(eg used above link)

 
 //Note  Scrollview : Remove for Content Layout Guide : "uncheck the Content Layout Guides" in right Tools second last option
 
 StackView : https://spin.atomicobject.com/2016/06/22/uistackview-distribution/
 */
import UIKit

class ScrollViewDemoVC2: UIViewController ,UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var myTableViewHeightConstant: NSLayoutConstraint!
    var items = ["Item 1", "Item2", "Item3", "Item4",
                 "Item 5", "Item6", "Item7", "Item8",
                 "Item 9", "Item10", "Item11", "Item12",
                 "Item 1", "Item2", "Item3", "Item4",
                              "Item 5", "Item6", "Item7", "Item8",
                              "Item 9", "Item10", "Item11", "Item12"]

  
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "ScrollView Demo 2"
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
       // self.demoTableView.rowHeight = 44;
        
        self.myTableView.isHidden = true
        self.myTableViewHeightConstant.constant = 0

        scrollView.layoutIfNeeded()
        
    }
    
    @IBAction func btnShowTable(_ sender: Any) {
        
        self.myTableView.isHidden = false
        self.myTableViewHeightConstant.constant = 200

        scrollView.layoutIfNeeded()
    }
    
    
    @IBAction func btnHideTable(_ sender: Any) {
        
        self.myTableView.isHidden = true
        self.myTableViewHeightConstant.constant = 0

        scrollView.layoutIfNeeded()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  =  myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ScrollDemoVC2TVCell

      
        cell.lblProduct.text =  items[indexPath.row]

        return cell
    }
   

}

extension ScrollViewDemoVC2 {
   
    static func shareInstance() -> ScrollViewDemoVC2
    {
        return ScrollViewDemoVC2.initiateFromStoryboard(name: storyBoardName.HomeModule)
    }
    
   
    
    
  
}
