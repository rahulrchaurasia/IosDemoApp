//
//  TestVew.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 04/07/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit

class TestVew: UIView {

    @IBOutlet var containerMenu: UIView!
    

    @IBOutlet weak var lblLabel: UILabel!
    
    
    @IBOutlet weak var ImgBack: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
       
        super.init(coder: coder)
        commitInit()
    }
    
    private func commitInit(){
        
           
        Bundle.main.loadNibNamed("TestView", owner: self, options: nil)
              containerMenu.fixInView(self)
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
