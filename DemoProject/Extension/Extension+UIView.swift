//
//  Extension+UIView.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 02/11/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import Foundation
import UIKit

//Refrence : For Corner radius
//https://www.advancedswift.com/corners-borders-shadows/#corner-radius

//    https://www.youtube.com/watch?v=Kt9XiUpmcWY      (VIP)

extension UIView {
    
   /*****************************************************/
    //Mark : TextField with Bottom border Color
    func addBootomBorderLineWithColor(color: UIColor, width: CGFloat) {
            let bottomLine = CALayer()
            bottomLine.backgroundColor = color.cgColor
        bottomLine.frame = CGRect(x: 0, y: self.frame.height - width,
                                  width: self.frame.width,
                                  height: width)
            layer.addSublayer(bottomLine)
        }
    
    /*****************************************************/
    
    @discardableResult
    func corners(_radius: CGFloat) -> UIView{
        
        self.layer.cornerRadius = _radius
        self.layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    func shadow(radius: CGFloat, color: UIColor, offset : CGSize, opacity : Float ) -> UIView {
        
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        return self
    }
    
}

class SCView : UIView {
    
//    init(radius: CGFloat, color: UIColor, offset : CGSize, opacity : Float , cornerRadius : CGFloat){
//
//        super.init(frame: .zero)
//        self.layer.shadowRadius = radius
//        self.layer.shadowColor = color.cgColor
//        self.layer.shadowOffset = offset
//        self.layer.shadowOpacity = opacity
//
//        self.layer.cornerRadius = radius
//        self.clipsToBounds = true
//        self.layer.masksToBounds = false
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    init(){
        
        super.init(frame: .zero)
    }
    func shadowCorner (radius: CGFloat, color: UIColor, offset : CGSize, opacity : Float , cornerRadius : CGFloat){
        
       
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        
      
    }
}
