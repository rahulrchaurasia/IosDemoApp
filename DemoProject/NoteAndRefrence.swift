//
//  test.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 01/04/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//


//
// ***********************  Constraint  ****************************************
//// Dynamic Leading, Trailing constraint including aspect ratio
// ***************************************************************
/*
    https://www.youtube.com/watch?v=I1Z3vvSad8Y
 
 */





//******************************************************************//




//Round Cornoer:
//  https://fluffy.es/rounded-corner-shadow/
//


// SwiftUI github link : https://github.com/rebeloper/
//
// For Corner and Border
//https://www.advancedswift.com/corners-borders-shadows/#corner-radius


// ***************************************************************
//// Custom View Created By class SCView for Corner and Shadow
// ***************************************************************
// @IBOutlet weak var customView: SCView!  // Created By Class



//***************************************************************
//  Selector For Click of Button or View
//***************************************************************/
//  REfer DynamicLabelVC and CommonWebView
// https://cocoacasts.com/swift-fundamentals-working-with-tap-gesture-recognizers-in-swift
//
//1>
// button.addTarget(self, action: #selector(self.buttonDisclTapped), for: .touchUpInside)
//
//   @objc func buttonDisclTapped(_ button:UIButton){
//
//
//    }
//
//
// >>>>>>>>>>>> For View >>>>>>>>>>>>>>>>>>>>>>>>.
//
// 2> let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
//
// self.appBar.btnBack.addGestureRecognizer(gesture)
//
// @objc func clickAction(sender : UITapGestureRecognizer) {
//
//     switch sender.view {
//       case appBar.btnBack:
//           print("tapped Image View 1") //add your actions here
//           navigationController?.popViewController(animated: true)
//
//       default:
//           print("Tap not detected")
//
//
//       }
//
// }

//************** For Carosel Effect */************
  // https://github.com/manaldes/Training
 //https://github.com/yogeshpatelios/Swift-4---How-to-create-iCarousel-effect-in-CollectionView-Using-UPCarouselFlowLayout-iOS-Hindi.
 //**************************************************

   
//************** Literal For Image Color and File */***********************
 
// Use #imageLiteral(   2>  #colorLiteral(    3> #fileLiteral(
//https://stackoverflow.com/questions/69346531/image-literal-commands-not-working-in-xcode
 //************************************************************************

        /*
        #imageLiteral(
        The image literal should be displayed and available for picking the image.

        The same appears to work for the other literals:

        #colorLiteral(
        #fileLiteral(
         */

        //#imageLiteral(   : Type This Much



//************** CollectionView and TableView */***********************
 
      // Check Weather Cell is Selected Or Not 
     // if(cell.isSelected ){

      //***** For Scroll at particular position or select particular item  ********/

/*
     self.maincollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
      or
    self.maincollectionView.selectItem(at: index, animated: false, scrollPosition: .centeredHorizontally)
 
    self.maincollectionView.setNeedsLayout()

*/

    //***** Get Cell Of CollectionViewCell Uing CollectionView and index position ********/
    /*
        let pcell : CollectionViewCell = self.maincollectionView!.cellForItem(at: index) as! CollectionViewCell
        pcell.setBackground()
     */

//*****Reload / Insert / Delete row action in tableView [Swift 5]  //*****
//https://medium.com/bandyliuk-code/reload-insert-delete-row-action-in-tableview-swift-5-dd8e978218b7
/*
 1> Reload row :--
     let indexPath = IndexPath(row: 0, section: 0)
     tableView.beginUpdates()
     tableView.reloadRows(at: [indexPath], with: .none)
     tableView.endUpdates()
 
 2> Insert row :--
     let indexPath = IndexPath(row: 0, section: 0)
     tableView.beginUpdates()
     tableView.insertRows(at: [indexPath], with: .none)
     tableView.endUpdates()
 
 */

//************************************************************************

   //https://www.youtube.com/watch?v=ClrSpJ3txAs&t=155s
