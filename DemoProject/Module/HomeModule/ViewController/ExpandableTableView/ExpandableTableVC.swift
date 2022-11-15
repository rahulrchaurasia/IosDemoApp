//
//  ExpandableTableVC.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 09/11/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

//***************** Space between Tableview Cell Using StoryBoad ******/
// Note : Space between Tableview Cell Using StoryBoad
// 1> we can adjust the height of the header and footer of sections of tableview in the storyboard (See. storyboard/tableview/section/footer height
//2> set tableview background : white as per our requirements (bec default its grey)
import UIKit


class ExpandableTableVC: UIViewController {

    var menuData = [cellData]()
    @IBOutlet weak var expandableTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
        
        expandableTV.dataSource = self
        expandableTV.delegate = self
      
        self.getMenuData()
        
        
        
    }
    
    
    func getMenuData() ->  [cellData]{
        
        menuData = [ cellData(opened: false, title: "Title1", sectionData: [childData(subtitle: "Cell1"),childData(subtitle: "Cell2"),childData(subtitle: "Cell3"), ]),
                     cellData(opened: false, title: "Title2", sectionData: [childData(subtitle: "Cell1"),childData(subtitle: "Cell2"),childData(subtitle: "Cell3"), ]),
                     cellData(opened: false, title: "Title3", sectionData: [childData(subtitle: "Cell1"),childData(subtitle: "Cell2"),childData(subtitle: "Cell3"), ]),
                     cellData(opened: false, title: "Title4", sectionData: [childData(subtitle: "Cell1"),childData(subtitle: "Cell2"),childData(subtitle: "Cell3"), ]),
                     cellData(opened: false, title: "Title5", sectionData: [childData(subtitle: "Cell1"),childData(subtitle: "Cell2"),childData(subtitle: "Cell3"), ]),
                     cellData(opened: false, title: "Title6", sectionData: [childData(subtitle: "Cell1"),childData(subtitle: "Cell2"),childData(subtitle: "Cell3"), ]),
                     
        ]
        
        return menuData
    }

    @IBAction func btnBack(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    

}

extension ExpandableTableVC {
    
    static func shareInstance() -> ExpandableTableVC
    {
        return ExpandableTableVC.initiateFromStoryboard(name: storyBoardName.HomeModule)
    }
}

extension ExpandableTableVC: UITableViewDelegate,UITableViewDataSource {
   
    
  // Define no. of Main Section ie Module (Inside each section related child is configured)
   func numberOfSections(in tableView: UITableView) -> Int {
       
       return menuData.count
    }
    
    // Default Add Title For Us
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return  menuData[section].title
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if menuData[section].opened == true {
            
            //***Note1 :--> Add extra One added in child Count because we use logic that one row is Default for Header
            return  menuData[section].sectionData.count + 1
        }else{
            return 1      // Default header Count is One
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataIndex = indexPath.row - 1   // Because One Row is taken by Header hence Subtract by 1 see: Note1
        if(indexPath.row == 0){
            
            let cell = expandableTV.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExpandableViewCell
            
            
            cell.lblTitle?.text = menuData[indexPath.section].title
            cell.downImg.isHidden = false
            cell.mainView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 0.5246792219)
            cell.mainView.layer.borderWidth = 1.0
            cell.mainView.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 0.8952297185)
            
           // cell.mainView.tag =  indexPath.section
           
            return cell
        }else{
            
            let cell =  expandableTV.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExpandableViewCell
            
            cell.lblTitle?.text = menuData[indexPath.section].sectionData[dataIndex].subtitle
            
            cell.downImg.isHidden = true
            cell.mainView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.mainView.layer.borderWidth = 1.0
            cell.mainView.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 0.8952297185)
            
            cell.mainView.tag =  100
            return cell
        }
       
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if(indexPath.row == 0){
            if(menuData[indexPath.section].opened ==  true){
                
                menuData[indexPath.section].opened =  false
                let section =  IndexSet.init(integer: indexPath.section)
                expandableTV.reloadSections(section, with: .fade)
                
            }else{
                menuData[indexPath.section].opened =  true
                let section =  IndexSet.init(integer: indexPath.section)
                expandableTV.reloadSections(section, with: .fade)
            }
        }else{
            
           let dataIndex = indexPath.row - 1
            
           let childData = menuData[indexPath.section].sectionData[dataIndex].subtitle
            
            moveToSelectedVC(str: childData)
        }
        
       
        
        //  moveToSelectedVC( str: menuData[indexPath.section].sectionData[indexPath.row - 1].subtitle)
    }
    
    
    func moveToSelectedVC( str : String ){
        
        showAlert(message: "Child \(str)")
        
    }
}

