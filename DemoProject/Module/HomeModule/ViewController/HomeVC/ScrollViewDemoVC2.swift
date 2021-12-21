//
//  ScrollViewDemoVC2.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 14/12/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//
/*
        
 https://www.youtube.com/watch?v=INkeINPZddo
 
 Note : TableView Inside ScrollView :
 
 1> we have to give height to Our table View Other wise it will not display
 
 2> or we have to set height of tableview according with scroolview(eg used above link)

 */
import UIKit

class ScrollViewDemoVC2: UIViewController ,UITableViewDataSource, UITableViewDelegate {
   
    
    
    @IBOutlet weak var myTableView: UITableView!
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
