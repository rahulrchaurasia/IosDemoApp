//
//  CustomCollectionView.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 08/11/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

/*
 
 Custom Collection View :-- (We have to apply Height and width on specific collection View in ViewControll
https://stackoverflow.com/questions/62081593/apply-uicollectionviewdelegateflowlayout-on-specific-collection-view-in-view-con
 
 
 */

import Foundation
import UIKit

public class ImageCollectionView: UICollectionView {

  override public func awakeFromNib() {
    super.awakeFromNib()

    self.delegate = self
      
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ImageCollectionView: UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let collectionWidth = collectionView.bounds.width
        // return CGSize(width:collectionWidth/2 - 2, height: collectionWidth/2)
        
        
        return CGSize(width: 100.0, height: 140.0)
        
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
   
}

