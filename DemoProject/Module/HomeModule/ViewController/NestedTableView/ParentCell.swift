//
//  ParentCell.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 11/11/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import UIKit

class ParentCell: UITableViewCell {
    
    
   
    @IBOutlet weak var ParentView: UIView!
    
    
   // @IBOutlet weak var ChildCellHeight: NSLayoutConstraint!
    @IBOutlet weak var ChildTableView: UITableView!
    
   
    
    @IBOutlet weak var btnTapParent: UIButton!
    @IBOutlet weak var downImg: UIImageView!
    
    @IBOutlet weak var lblHeaderTitle: UILabel!
    
    
    var tapInfoProd: (() -> ())?    // Mostly Use This
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        ChildTableView.delegate = self
//        ChildTableView.dataSource = self
        
        self.ParentView.layer.cornerRadius = 22.0
        self.ParentView.layer.borderWidth = 1.0
        self.ParentView.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 0.8952297185)
        
//        self.ChildTableView.rowHeight = UITableView.automaticDimension
//        self.ChildTableView.estimatedRowHeight = 370
        
      
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 12, left: 10, bottom: 0, right: 8))
        btnTapParent.addTarget(self, action: #selector(self.clickAction), for: .touchUpInside)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

      
        self.ParentView.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.2980908526)
        
       // ChildCellHeight.constant = ChildTableView.contentSize.height
        
        
    }

    // Inside UITableViewCell subclass
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @objc func clickAction(_ button:UIButton) {
        
        
           tapInfoProd?()
    }
   
}


extension ParentCell: UITableViewDelegate,UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//       return 360
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       //Note : Get the Tag  Section
        
//        if(menuData[ChildTableView.tag].opened ==  true){
//            return menuData[ChildTableView.tag].sectionData.count
//        }else{
//
//            return 0
//        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let ChildCell  =  ChildTableView.dequeueReusableCell(withIdentifier: "ChildCell", for: indexPath) as! ChildCell
        
        ChildCell.lblChildTitle.text =
        menuData[ChildTableView.tag].sectionData[indexPath.row].subtitle
        
       
//        ChildCellHeight.constant = ChildTableView.contentSize.height

        
      
        
        return ChildCell
    }
    
    
    
    
}
 

