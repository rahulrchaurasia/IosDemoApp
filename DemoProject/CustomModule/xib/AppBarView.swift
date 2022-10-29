//
//  AppBarView.swift
//  DemoProject
//
//  Created by Rahul on 02/01/22.
//  Copyright © 2022 Rahul. All rights reserved.
//

import UIKit

 class AppBarView: UIView {

    
    @IBOutlet var containerView: UIView!
    
   
    @IBOutlet weak var lblTitle: UILabel!
    
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var btnOther: UIButton!
    

    @IBOutlet weak var imgBack: UIImageView!
    
    
    @IBOutlet weak var imgOther: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
       
        super.init(coder: coder)
        commitInit()
    }
    
    private func commitInit(){
        
           
        Bundle.main.loadNibNamed("AppBarView", owner: self, options: nil)
        containerView.fixInView(self)
//          containerMenu.addSubview(self);
//        containerMenu.frame = self.bounds
//        containerMenu.autoresizingMask = [.flexibleHeight , .flexibleWidth]
    }

}

extension UIView
{
   func fixInView(_ container: UIView!) -> Void{
       self.translatesAutoresizingMaskIntoConstraints = false;
       self.frame = container.frame;
       container.addSubview(self);
       NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
       NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
       NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
       NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
   }
}
