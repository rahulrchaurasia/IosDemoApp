//
//  HistoryVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 03/07/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit
import SwiftUI

/*
 
 Issue : UICollectionView scroll to item not working with horizontal direction
 
 https://stackoverflow.com/questions/41884645/uicollectionview-scroll-to-item-not-working-with-horizontal-direction
 
 collectionView.isPagingEnabled = false
 collectionView.scrollToItem(
     at: IndexPath(item: value, section: 0),
     at: .centeredHorizontally,
     animated: true
 )
 collectionView.isPagingEnabled = true
 
 *******************************************************
 2 >UICollectionView Custom Cell with Horizontal Scroll
 
 https://www.youtube.com/watch?v=PxPtV98dxCs&t=900s
 
 **************************** VVIMP ***************************
3 >  Custom Collection View :-- (We have to apply Height and width on specific collection View in ViewControll
https://stackoverflow.com/questions/62081593/apply-uicollectionviewdelegateflowlayout-on-specific-collection-view-in-view-con
 
 */


class HistoryVC: UIViewController {
    
    var arrData = [ModelCollectionFlowLayout]()
    // For Carosouel effect
    @IBOutlet weak var maincollectionView: UICollectionView!
    
    //@IBOutlet weak var childCollectionView: UICollectionView!
    
    @IBOutlet weak var childCollectionView: ImageCollectionView!  // Custom CollectionView
    
    var isSlidding = false
    var timer : Timer?
    var currentCellIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        maincollectionView.delegate = self
        maincollectionView.dataSource = self
        
//        childCollectionView.delegate = self
        childCollectionView.dataSource = self

        collectData() // All CollectionView Data
        
      
        self.maincollectionView.showsHorizontalScrollIndicator = false
        self.maincollectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        
        // For XIB
//        self.childCollectionView.showsHorizontalScrollIndicator = false
//        self.childCollectionView.register(UINib.init(nibName: "dashBoardShortViewCell", bundle: nil), forCellWithReuseIdentifier: "ShortCell")
//
        
        let floawLayout = UPCarouselFlowLayout()
        floawLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60.0, height: maincollectionView.frame.size.height)
        floawLayout.scrollDirection = .horizontal
        floawLayout.sideItemScale = 0.8
        floawLayout.sideItemAlpha = 1.0
        floawLayout.spacingMode = .fixed(spacing: 5.0)
        maincollectionView.collectionViewLayout = floawLayout
       
    
    }
    
    
    override func viewDidLayoutSubviews() {


        // ***************  Slidding ImageView Using Collection View *****************//
        // Note : UICollectionViewScrollPosition not working ( hence viewDidLayoutSubviews())
        // Reason : if we called it in viewDidLoad() app will crash given null point exception
        // Its Only work in this method.

//        if(isSlidding == false){
//
//            DispatchQueue.main.async{
//                self.timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.slideToNext), userInfo: nil, repeats: true)
//
//
//            }
//        }
//
        
//        let index = IndexPath.init(item: 0, section: 0)
//
//        self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
//
//        self.collectionView.setNeedsLayout()
        
       
       // let timer = 3
        
        
//
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
//            let index1 = IndexPath.init(item: 1, section: 0)
//            self.collectionView.scrollToItem(at: index1, at: .centeredHorizontally, animated: true)
//
//            self.collectionView.setNeedsLayout()
//        }

        
       
    }
    
    func getData(){
        
        isSlidding = true
        
        
        if(currentCellIndex < arrData.count - 1){
            
            
            self.maincollectionView.isPagingEnabled = false
            let index = IndexPath.init(item: currentCellIndex, section: 0)
            debugPrint("Position Current Index \(index)")
            
            maincollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            
            self.maincollectionView.setNeedsLayout()
            
            
            currentCellIndex = currentCellIndex + 1
            
           // debugPrint("Position Current \(currentPage)")
           
        }else{
            
            self.maincollectionView.isPagingEnabled = false
            currentCellIndex = 0
            let index = IndexPath.init(item: currentCellIndex, section: 0)
            
            maincollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)//
            // collectionView.scrollToItem(at: index, at: .left, animated: false)
            self.maincollectionView.setNeedsLayout()
            debugPrint("Start  OF Collection  \(currentCellIndex) ")
        }
        self.maincollectionView.isPagingEnabled = true
        
        
    }

    
    
    
    
    ///////////////////////
    
    @objc func slideToNext (){
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.getData()
                
        }
        
       
        
    }
    
    
    
    @IBAction func btnNext(_ sender: Any) {
        
        let objVC =  AddVC.shareInstance()
        
        navigationController?.pushViewController(objVC, animated: true)
        
        //showAlert(message: "History")
        
    }
    
    
    func collectData(){
       
        arrData = [
            
            ModelCollectionFlowLayout(title: "Demo 1", image: #imageLiteral(resourceName: "4")),
            ModelCollectionFlowLayout(title: "Demo 2", image: #imageLiteral(resourceName: "2")),
            ModelCollectionFlowLayout(title: "Demo 3", image: #imageLiteral(resourceName: "3")),
            ModelCollectionFlowLayout(title: "Demo 4", image: #imageLiteral(resourceName: "slide1")),
            ModelCollectionFlowLayout(title: "Astodiya Darwaza 5", image: #imageLiteral(resourceName: "astodiyaDarwaza")),
            
        ModelCollectionFlowLayout(title: "Dariyapur Darwaza 6", image: #imageLiteral(resourceName: "dariyapurDarwaza")),
        ModelCollectionFlowLayout(title: "Delhi Darwaza 7", image: #imageLiteral(resourceName: "delhiDarwaza")),
        ModelCollectionFlowLayout(title: "Jamalpur Darwaza 8", image: #imageLiteral(resourceName: "jamalpurDarwaza")),
        ModelCollectionFlowLayout(title: "Prem Darwaza 9", image: #imageLiteral(resourceName: "premDarwaza")),
        ModelCollectionFlowLayout(title: "Raipur Darwaza 10", image: #imageLiteral(resourceName: "raipurDarwaza")),
        ModelCollectionFlowLayout(title: "Teen Darwaza 11", image: #imageLiteral(resourceName: "teenDarwaza")),
        ]
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.maincollectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
        
       
    }
    fileprivate var currentPage: Int = 0 {
        didSet {
           // print("page at centre = \(currentPage)")
        }
    }
    
    fileprivate var pageSize: CGSize {
        let layout = self.maincollectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }

    
}

extension HistoryVC {
    
    static func shareInstance() -> HistoryVC
    {
        return HistoryVC.initiateFromStoryboard(name: "Main")
    }
}

// MARK: UICollectionViewDelegate
extension HistoryVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    //ShortCell
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
           if collectionView == self.childCollectionView {
                return arrData.count
            } else {
                return arrData.count
            }
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.childCollectionView {
            
            let childcell = collectionView.dequeueReusableCell(withReuseIdentifier: "pCell", for: indexPath) as! dashBoardShortViewCell
            
           
            /********************* Bind All data in Cell Directly *******************************/
//            childcell.img.image = arrData[indexPath.row].image
//            childcell.lblTitle.text = arrData[indexPath.row].title
            
            childcell.configureCell(menu: arrData[indexPath.row])
           
            
//            childcell.tapInfoProd = {
//
//                self.showAlert(message: "Parent")
//
//            }
            
            // Added in DashBoard Cell For Experiment
            childcell.onRenameLabelButtonDidPress = { () in
               // self.showAlert(message: "Child")
                //childcell.changeTitleLabel(with: "Hello there!")
                
                 // For CollectionView  Scroll at  particular position
                let index = IndexPath.init(item: indexPath.row, section: 0)
                self.maincollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
                
               // self.maincollectionView.selectItem(at: index, animated: false, scrollPosition: .centeredHorizontally)
                self.maincollectionView.setNeedsLayout()
                
                /***** Get Cell Of CollectionViewCell Uing CollectionView and index position ********/
                
//                let pcell : CollectionViewCell = self.maincollectionView!.cellForItem(at: index) as! CollectionViewCell
//                pcell.setBackground()
                
            }
            
            //Note: Parameterized Closure demo. Data is come from ViewCell through parameter {Use when tag is attached with cell}
            
//            childcell.onAlertPresentButtonDidPress = { (message) in
//                childcell.changeTitleLabel(with: message)
//
//            }
            
          
           
           return childcell
        }else{
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
           cell.img.image = arrData[indexPath.row].image
           cell.lblTitle.text = arrData[indexPath.row].title
            
            if(cell.isSelected ){
                
                cell.setBackground()
                
                
            }else{
                
            
                cell.resetBackground()
               
            }
            
            // Note : Use CollectionVie didSelectItemAt Event
//            cell.tapInfoProd = {
//
//               // self.showAlert(message: "Parent")
//
//                cell.setBackground()
//
//
//                // for obj in self.arrData {
//                // }
//
//
//            }
            
            
            
           
           return cell
            
        }
        
    }
    
    
    
    //******************************************************//
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

       
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {


            cell.setBackground()
            
           

           // showAlert(message:  " Data is  \(String(describing: maincollectionView.indexPathsForSelectedItems))")



           // maincollectionView.reloadData()
        }


    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {


            cell.resetBackground()
          //  cell.contentView.backgroundColor =  UIColor.white

        }
    }


  //******************************************************//

  //*********************************************************//
    

        

        
    
}
    





