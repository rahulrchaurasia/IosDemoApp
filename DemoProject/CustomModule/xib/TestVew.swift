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

 
