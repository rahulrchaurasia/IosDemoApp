//
//  ExpandableTableVC.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 09/11/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import UIKit

struct cellData{
    
    var opened = Bool()
    var title = String()
    var sectionData = [String]()   //Child
    
    
}

class ExpandableTableVC: UITableViewController {

    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        tableViewData = [ cellData(opened: false, title: "Title1", sectionData: ["Cell1,Cell2,Cell3"]),
                          cellData(opened: false, title: "Title2", sectionData: ["Cell1,Cell2,Cell3"]),
                          cellData(opened: false, title: "Title3", sectionData: ["Cell1,Cell2,Cell3"]),
                          cellData(opened: false, title: "Title4", sectionData: ["Cell1,Cell2,Cell3"]) ]
    }
    

   
    override func numberOfSections(in tableView: UITableView) -> Int {
       
       return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if tableViewData[section].opened == true {
            
            return  tableViewData[section].sectionData.count
        }else{
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if(indexPath.row == 0){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row]
            return cell
        }
       
    }

}
