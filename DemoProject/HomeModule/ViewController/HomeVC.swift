//
//  HomeVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 18/03/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit
import SideMenu
import TTGSnackbar


/*
 1>   Slide Menu  :-- pod 'SideMenu'
 we not given the slide menu version ie why presentation style not working for that we have to used func prepare
 note : for swift 5 used pod 'SideMenu', '~> 6.0'
 
 how to used :--  Required Only Navigation Controller which is connected with menu View Controller.
 In Navigation set class: SideMenuNavigationController ,module :SideMenu
 and set storyboard id : LeftMenuNavigationController ()
 
 
 makeSettings()  is used for set the value of slider.
 
 */

let reachability = try! Reachability()

class HomeVC: UIViewController {
    
   
    // var arrBannerSlider = [String]()
    var arrBannerSlider = ["banner1","banner2","banner3","banner4","banner5","banner6","banner7","banner_old1","banner_old2"]
    var timer : Timer?
    var currentCellIndex = 0
    var isSlidding = false
    @IBOutlet weak var bannerSliderCollView: UICollectionView!
    
    @IBOutlet weak var bannerPageControl: UIPageControl!
    
    private let sideMenu = SideMenuNavigationController(rootViewController: UIViewController())
    
     
    @IBOutlet weak var lblData: UILabel!
    
    //declare this property where it won't go out of scope relative to your listener
   
    
    // var firstNames: [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)  // For hiding the title bar
        print("TAG" + "WillAppear ")
        
        
       

        //  DispatchQueue.main.async {
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
                
            } else {
                print("Reachable via Cellular")
            }
           // self.showAlert(message: "WiFi reachable")
            
           
            if let viewControllers = self.navigationController?.viewControllers {
                  for vc in viewControllers {
                       if vc.isKind(of: customAlertVC.classForCoder()) {
                            print("PPP It is in stack")
                            //Your Process
                        self.navigationController?.popViewController(animated: true)
                       }
                  }
            }
            
        
        }
        reachability.whenUnreachable = { [self] _ in
            print("Not reachable")
            
                                          let storyboard = UIStoryboard(name: "customAlert", bundle: .main)
                                          let alertVC =  storyboard.instantiateViewController(withIdentifier: "customAlertVC") as! customAlertVC

                                          alertVC.hidesBottomBarWhenPushed = true
                                          self.navigationController?.pushViewController(alertVC, animated: false)

            
            
            
            //self.getNetworkAlert(message: "No Network")
          //  self.showAlert(message: "Not reachable")
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
            
        }
        // }
        
    }
    
    deinit {
       
         reachability.stopNotifier()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSideMenu()
        
        NotificationCenter.default.addObserver(self, selector: #selector(NotifyData1(notification:)),
               name: .NotifyData1, object: nil)
      
        
    }
    
    @objc func NotifyData1(notification : Notification){
        
        lblData.text = "Notification Called"
    }
    
    func getNetworkAlert(message : String){
        
        let snackbar = TTGSnackbar(
            message: message,
            duration: .forever,
            actionText: "RETRY",
            
            actionBlock: { (snackbar) in
                print("Click action!")
            }
        )
        //appIcon
        snackbar.icon = UIImage(named: "info_icon")
        snackbar.show()
    }
    
    @IBAction func btnLogout(_ sender: Any) {
        

        let childVC = CustomVC.shareInstance()
        childVC.hidesBottomBarWhenPushed = true          // For Hiding the Bottom bar
        self.navigationController?.pushViewController(childVC, animated: true)


    }
    
   
    
    @objc func slideToNext (){
        
        isSlidding = true
        // self.bannerSliderCollView.isPagingEnabled = false
        if(currentCellIndex < arrBannerSlider.count ){
            
            let index = IndexPath.init(item: currentCellIndex, section: 0)
            
            self.bannerSliderCollView.isPagingEnabled = true
            bannerPageControl.numberOfPages = arrBannerSlider.count
            bannerPageControl.currentPage = currentCellIndex
            
            bannerSliderCollView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            self.bannerSliderCollView.setNeedsLayout()
            currentCellIndex = currentCellIndex + 1
        }else{
            
            currentCellIndex = 0
            
            let index = IndexPath.init(item: currentCellIndex, section: 0)
            
            self.bannerSliderCollView.isPagingEnabled = true
            bannerPageControl.numberOfPages = arrBannerSlider.count
            bannerPageControl.currentPage = currentCellIndex
            
            
            bannerSliderCollView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            self.bannerSliderCollView.setNeedsLayout()
        }
        

        
        //
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        print("TAG" + "viewWillLayoutSubviews ")
        
        
    }
    override func viewDidLayoutSubviews() {
        print("TAG" + "viewDidLayoutSubviews ")
        
    
        
        
        // ***************  Slidding ImageView Using Collection View *****************//
        // Note : UICollectionViewScrollPosition not working ( hence viewDidLayoutSubviews())
        // Reason : if we called it in viewDidLoad() app will crash given null point exception
        // Its Only work in this method.
        
        if(isSlidding == false){
            
            DispatchQueue.main.async {
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.slideToNext), userInfo: nil, repeats: true)
                
                
            }
        }
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        print("TAG" + "viewDidAppear ")
        self.timer?.invalidate()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
          super.viewDidDisappear(animated)
          print("TAG" + "viewDidDisappear ")
         
    }
    
    
    
    @IBAction func btnNext(_ sender: Any) {
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.slideToNext), userInfo: nil, repeats: true)
            
        }
        
        
    }
    
    // Mark : --->  Slide Menu Related code
    
    /**************************** ************************************************************/
    private func setupSideMenu() {
        // Define the menus
        sideMenu.leftSide = true
        sideMenu.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
    
        
        // Note : below may required when we use pod 'SideMenu', '~> 6.0'
        
        //        SideMenuManager.default.leftMenuNavigationController = storyboard?.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? SideMenuNavigationController
        //
        
        //        let leftMenuNavigationController = SideMenuNavigationController(rootViewController: UIViewController())
        //        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigationController
        //        sideMenu.setNavigationBarHidden(true, animated: false)
        
        
        
        //   SideMenuManager.default.menuPresentMode = SideMenuManager.MenuPresentMode.viewSlideOutMenuPartialIn
        // SideMenuManager.default.leftMenuNavigationController?.presentationStyle = .menuSlideIn
        
        
        //  leftMenuNavigationController.statusBarEndAlpha = 0
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sideMenuNavigationController = segue.destination as? SideMenuNavigationController else { return }
        sideMenuNavigationController.settings = makeSettings()
        
        //  self.hidesBottomBarWhenPushed = true
    }
    
    
    func makeSettings() -> SideMenuSettings{
        var settings = SideMenuSettings()
        settings.allowPushOfSameClassTwice = false
        settings.presentationStyle = .menuSlideIn
        settings.statusBarEndAlpha = 0
        settings.presentationStyle.backgroundColor = UIColor.clear
        settings.menuWidth = UIScreen.main.bounds.width * 0.7
        return settings
        
        
    }
    
    /**************************** ************************************************************/
    
    
    
    // For setting navigation item programmitically
    // here not in used
    func configureNavigationBar(){
        
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu-button-of-three-lines").withRenderingMode(.alwaysOriginal), style:.plain, target: self, action: #selector(handleMenuToggle))
        
        
    }
    
    //MARK:- scrollViewDidScroll is default method for handling scrollview
     //For Display the page number in page controll of collection view Cell
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let visibleRect = CGRect(origin: self.bannerSliderCollView.contentOffset, size: self.bannerSliderCollView.bounds.size)
           let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
           if let visibleIndexPath = self.bannerSliderCollView.indexPathForItem(at: visiblePoint) {
               self.bannerPageControl.currentPage = visibleIndexPath.row
               currentCellIndex = visibleIndexPath.row
           }
    }
    
    
    
    
    @IBAction func didTapMenuButton(){
        
        present(sideMenu,animated:  true)
        
    }
    
    @objc func handleMenuToggle(){
        
        print("Toggle Menu")
    }
    
    func isModal() -> Bool {
        return self.presentingViewController?.presentedViewController == self
            || (self.navigationController != nil && self.navigationController?.presentingViewController?.presentedViewController == self.navigationController)
            || self.tabBarController?.presentingViewController is UITabBarController
    }
    
}

extension HomeVC {
    
    static func shareInstance() -> HomeVC
    {
        return HomeVC.initiateFromStoryboard(name: "Main")
    }
    
   
}

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arrBannerSlider.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! bannerSliderCollViewCell
        
        
        cell.imgView.image  = UIImage(named: arrBannerSlider[indexPath.row])
        return cell
    }
    
    
}

extension HomeVC : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: bannerSliderCollView.frame.width, height: bannerSliderCollView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
}
