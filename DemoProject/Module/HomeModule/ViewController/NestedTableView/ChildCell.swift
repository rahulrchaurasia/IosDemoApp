//
//  ChildCell.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 11/11/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import UIKit

class ChildCell: UITableViewCell {

    @IBOutlet weak var ChildView: UIView!
    
    @IBOutlet weak var lblChildTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ChildView.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.2980908526)
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
