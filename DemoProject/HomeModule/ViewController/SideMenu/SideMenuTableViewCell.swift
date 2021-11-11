//
//  SideMenuTableViewCell.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 24/03/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    
   
    @IBOutlet weak var menuImage: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configureCell(menu : MenuModel){
        
        lblName.text = menu.mName
        menuImage.image = UIImage(named: menu.mImg)
            
              
    }
}
