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

    //***** Get Cell Of CollectionViewCell Using CollectionView and index position ********/
    /*
        let pcell : CollectionViewCell = self.maincollectionView!.cellForItem(at: index) as! CollectionViewCell
        pcell.setBackground()
     */


    //***** Get Cell Of CollectionViewCell Using CollectionView and index position ********/
    /*
        let pcell =  self.expandableTV.cellForRow(at: indexPath)
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





//*****************************************************************
//      swift uitableview space between cells
//****************************************************************

/*  Inside UITableViewCell subclass
 override func layoutSubviews() {
     super.layoutSubviews()

     contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
 }
 */
//*****************************************************************
//      swift TABLEVIew Height equal to Actual Content Size
//****************************************************************
//https://www.youtube.com/watch?v=Kqf5Hkpt1ks
/*
ChildCellHeight.constant = ChildTableView.contentSize.height
*/

//*****************Remove Default Section Padding******/
 //tablebiew.sectionHeaderTopPadding  = 0


//******* When to use numberOfSections or numberOfRowsInSection *****/
//https://stackoverflow.com/questions/43339931/when-to-use-numberofsections-or-numberofrowsinsection-swift-3
/*
Note: func numberOfSections(in tableView: UITableView) -> Int // Default is 1 if not implemented
 numberOfSections is not required when you want "only the same type of repeated list" in your TableView
 ex  suppose you want to show below in your tableview
    1
    2
    3
    4
 in that case you will be required numberOfRowsInSection return 4 here your table will return 4 cells, if you not give numberOfSections this method it will be 1 by default
 
 ex 2 > But Suppose you need to show in your tableview that 1 2 3 4 A B C D It can be achieved by
 Number
 1
 2
 3
 4
 Alphabet
 A
 B
 C
 D
 Here You have to use numberOfSections and it should return 2, one for Number and second for Alphabet. and 1,2,3,4 and A,B,C,D are the rows under their section Number and Alphabet. 
 */
//************************************************************************

   //https://www.youtube.com/watch?v=ClrSpJ3txAs&t=155s
