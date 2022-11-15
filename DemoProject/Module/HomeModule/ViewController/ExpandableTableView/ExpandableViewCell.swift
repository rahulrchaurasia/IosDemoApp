//
//  ExpandableViewCell.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 10/11/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import UIKit

// Note : Space between Tableview Cell Using StoryBoad
// 1> we can adjust the height of the header and footer of sections of tableview in the storyboard
//2> set tableview background : white as per our requirements (bec default its grey)
class ExpandableViewCell: UITableViewCell {

    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var downImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       // self.mainView.layer.cornerRadius = 22.0
        self.mainView.layer.borderWidth = 1.0
        self.mainView.layer.borderColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 0.8952297185)
    }
    
    
    func isSectionOpen(){
        
        
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
