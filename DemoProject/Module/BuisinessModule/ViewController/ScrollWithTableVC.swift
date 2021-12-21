//
//  ScrollWithTableVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 21/12/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit

class ScrollWithTableVC: UIViewController , UITableViewDataSource , UITableViewDelegate {
   

    @IBOutlet weak var myTableView: UITableView!
    
    var items = ["Item 1", "Item2", "Item3", "Item4",
                 "Item 5", "Item6", "Item7", "Item8",
                 "Item 9", "Item10", "Item11", "Item12"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  =  myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ScrollWithTableViewCell

      
        cell.lblProduct.text =  items[indexPath.row]

        return cell
    }
    
   

}

extension ScrollWithTableVC {
   
    static func shareInstance() -> ScrollWithTableVC
    {
        return ScrollWithTableVC.initiateFromStoryboard(name: storyBoardName.BuisinessModule)
    }
    
   
    
    
  
}
