//
//  ScrollDemoVC2TVCell.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 21/12/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit

class ScrollDemoVC2TVCell: UITableViewCell {

    
  
//    @IBOutlet weak var imgProduct: UIImageView!
//
//    @IBOutlet weak var lblProductName: UILabel!
//
//    @IBOutlet weak var lblQuantity: UILabel!
//
//    @IBOutlet weak var lblPrice: UILabel!
//
//    @IBOutlet weak var lblAmount: UILabel!
//
  
    @IBOutlet weak var lblProduct: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(menu : MenuModel){
        
//        lblName.text = menu.mName
//        menuImage.image = UIImage(named: menu.mImg)
//
              
    }

}
