//
//  Extension+ScrollView.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 13/12/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import Foundation
import UIKit


extension UIScrollView {
   func scrollToBottom(animated: Bool) {
     if self.contentSize.height < self.bounds.size.height { return }
     let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height + self.contentInset.bottom)
     self.setContentOffset(bottomOffset, animated: animated)
  }
    
    func scrollToBottom(animated: Bool,contentInset : CGFloat) {
      if self.contentSize.height < self.bounds.size.height { return }
      let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height + contentInset)
      self.setContentOffset(bottomOffset, animated: animated)
   }
}
