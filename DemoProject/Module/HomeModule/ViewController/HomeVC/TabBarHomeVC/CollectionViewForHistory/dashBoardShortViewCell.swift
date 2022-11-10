//
//  dashBoardShortViewCell.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 07/11/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

/*
 Closure Demo
https://medium.com/teamarimac/perform-actions-on-a-uicollectionviewcell-using-closures-412585ed338f
 */

// Note:- First Cell Click Event or button  event which is created by gesture effect is called
// than Closure which is called in that event is triggered eg imageTapped Event has closure onRenameLabelButtonDidPress
// Once the closure is triggered its body is define in UITableView/CollectionView at cellForItemAt method.
// ie
/*  In HistoryVC 
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 
 childcell.onRenameLabelButtonDidPress = { () in
     self.showAlert(message: "Child")
     
 }
*/
 import UIKit

class dashBoardShortViewCell: UICollectionViewCell {

    
    @IBOutlet weak var shortView: UIView!
   
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var onRenameLabelButtonDidPress: (() -> ())?    // Mostly Use This
    
    var tapInfoProd: ( () -> Void)? = nil   // Mostly Use This
    
    var onAlertPresentButtonDidPress: ((String) -> ())?   // Base On requiremnet if we req parameter pass in method
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.shortView.layer.cornerRadius = 13.0
        self.shortView.layer.borderWidth = 0.5
        self.shortView.layer.borderColor = #colorLiteral(red: 0.7343159318, green: 0.7343159318, blue: 0.7343159318, alpha: 1)
       // self.shortView.layer.backgroundColor =  #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 0.6983909354)
        self.shortView.layer.backgroundColor =  #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.2497671772)
        
        /************************************************/
        //  Mark : GestureRecognizer For View
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        shortView.isUserInteractionEnabled = true
        shortView.addGestureRecognizer(tapGestureRecognizer)
        
        
     
    }
    
    func configureCell(menu : ModelCollectionFlowLayout){
        
        lblTitle?.text = menu.title
        img.image =  menu.image
        // img.image =   UIImage(named: menu.mImg)
            
              
    }
    
    func setBackground() {
        
        self.shortView.layer.backgroundColor =  #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.9260140729)
        
    }
    func resetBackground() {
        
        self.shortView.layer.backgroundColor =  #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.2497671772)
        
    }
    
    func changeTitleLabel(with text: String) {
        self.lblTitle.text  = text
       
    }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
       
        // For Demo Purpose we pass 3 method here. Use Once
        
         // tapInfoProd?()
        
          onRenameLabelButtonDidPress?()
        
//        let message = "Hello World 😀"
//         onAlertPresentButtonDidPress?(message)
    }
    

}
