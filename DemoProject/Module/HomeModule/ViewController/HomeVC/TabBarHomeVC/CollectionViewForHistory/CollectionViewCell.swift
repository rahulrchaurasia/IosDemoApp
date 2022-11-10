//
//  CollectionViewCell.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 02/11/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import UIKit

//Note: If we apply Gesture Effect on  Cell than Debault cell behavior ie cell selected /didSelected event are not triggered
class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var mainView: UIView!
   
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    
   // var tapInfoProd: ( () -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
       
        self.mainView.layer.cornerRadius = 13.0
        self.mainView.layer.borderWidth = 1.0
        self.mainView.layer.shadowColor = UIColor.black.cgColor
        self.mainView.layer.shadowOpacity = 0.5
        self.mainView.layer.shadowOffset = .zero
        self.mainView.layer.shadowPath = UIBezierPath(rect: self.mainView.bounds).cgPath
        self.mainView.layer.shouldRasterize = true
        
        /************************************************/
        //  Mark : GestureRecognizer For View
        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
//        mainView.isUserInteractionEnabled = true
//        mainView.addGestureRecognizer(tapGestureRecognizer)

    }
    
    
    func setMainBackground(){
        
        self.mainView.layer.backgroundColor =  #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.6983909354)
    }
    
    func setBackground() {
        
        self.mainView.layer.backgroundColor =  #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.9260140729)
        
    }
    func resetBackground() {
        
        self.mainView.layer.backgroundColor =  #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        
    }
//    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
//    {
//
//          tapInfoProd?()
  //  }

}
