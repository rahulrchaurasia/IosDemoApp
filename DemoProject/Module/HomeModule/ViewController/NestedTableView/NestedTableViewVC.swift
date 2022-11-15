//
//  NestedTableViewVC.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 11/11/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import UIKit

var menuData = [ cellData(opened: false, title: "Title1",
                          sectionData: [childData(subtitle: "Cell1"),childData(subtitle: "Cell2") ]),
                 cellData(opened: false, title: "Title2",
                          sectionData: [childData(subtitle: "Cell1"),childData(subtitle: "Cell2"),childData(subtitle: "Cell3") ]),
                 cellData(opened: false, title: "Title3",
                          sectionData: [
                            childData(subtitle:
                                        "Cell1"),
                            childData(subtitle: "Cell2"),
                            childData(subtitle: "Cell3"),
                            childData(subtitle: "Cell4"),
                            childData(subtitle: "Cell5"),
                            childData(subtitle: "Cell6")]),
                 cellData(opened: false, title: "Title4",
                          sectionData: [childData(subtitle: "Cell1"),childData(subtitle: "Cell2"),childData(subtitle: "Cell3"), ]),
                 cellData(opened: false, title: "Title5", sectionData: [childData(subtitle: "Cell1"),childData(subtitle: "Cell2"),childData(subtitle: "Cell3"), ]),
                 cellData(opened: false, title: "Title6", sectionData: [childData(subtitle: "Cell1"),childData(subtitle: "Cell2"),childData(subtitle: "Cell3"), childData(subtitle: "Cell4"),
                                                                        childData(subtitle: "Cell5"),
                                                                        childData(subtitle: "Cell6") ]),
                 cellData(opened: false, title: "Title7",
                          sectionData: [childData(subtitle: "Cell1"),childData(subtitle: "Cell2"),childData(subtitle: "Cell3") ])
                 
]

class NestedTableViewVC: UIViewController {

   // var menuData = [cellData]()
    @IBOutlet weak var ParentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ParentTableView.delegate = self
        ParentTableView.dataSource = self
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        
       
//        ParentTableView.estimatedRowHeight = UITableView.automaticDimension
        
       // self.view.addSubview(ParentTableView)
        
      //  ParentTableView.reloadData()
    }
    
    
   

    @IBAction func btnBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    

}

extension NestedTableViewVC {
    
    static func shareInstance() -> NestedTableViewVC
    {
        return NestedTableViewVC.initiateFromStoryboard(name: storyBoardName.HomeModule)
    }
}
extension NestedTableViewVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData.count
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.layoutIfNeeded()
        }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell  =  ParentTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ParentCell

        
        cell.lblHeaderTitle.text = menuData[indexPath.row].title
        
        // Remove cell highlight/selection color
        // Remove cell highlight/selection color
           cell.selectionStyle = .none
       
        //Note : Tag The particular Section
        cell.ChildTableView.tag = indexPath.row
        
        debugPrint("Section :  \( indexPath.row )")
        
        
        
        cell.tapInfoProd = {
            
             self.showAlert(message: "Parent")
            /*
           
            if(menuData[indexPath.row].opened ==  true){
                
                //cell.ChildCellHeight.constant = 0
                menuData[indexPath.row].opened =  false
//                let row =  IndexSet.init(integer: indexPath.row)
//                self.ParentTableView.reloadSections(row, with: .top)
//
                //cell.ChildTableView.isHidden = true
               
                    
                    let section =  IndexSet.init(integer: indexPath.row)
                    cell.ChildTableView.reloadSections(section, with: .bottom)

            }else{
                
//                cell.ChildCellHeight.constant = cell.ChildTableView.contentSize.height
                menuData[indexPath.row].opened =  true
//                let row =  IndexSet.init(integer: indexPath.row)
               
                
                
                    let section =  IndexSet.init(integer: indexPath.row)
                    cell.ChildTableView.reloadSections(section, with: .bottom)


                
                //cell.ChildTableView.isHidden = false
            }
            
            */
            
        }
                    
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//       //showAlert(message: "Parent")
//
//        let pcell : ParentCell = self.ParentTableView.cellForRow(at: indexPath) as! ParentCell
//
//
//        if(menuData[indexPath.row].opened ==  true){
//
//            pcell.ChildCellHeight.constant = 0
//            menuData[indexPath.section].opened =  false
//        }else{
//
//            pcell.ChildCellHeight.constant = pcell.ChildTableView.contentSize.height
//            menuData[indexPath.section].opened =  true
//        }
//
//    }
    
}
