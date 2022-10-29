//
//  CommonWebVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 16/11/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit
import WebKit

/*
Note : In UI  AppBar XIB added for  Handling Navigation Title custom
 
*/

class CommonWebVC: UIViewController , WKNavigationDelegate, WKScriptMessageHandler {
  
    

    @IBOutlet weak var appBar: AppBarView!
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIView(webview)
       

       // webview.load(URLRequest(url: URL(string: "https://www.google.com")!))
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        appBar.lblTitle.text =  "WebView Demo"
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
        
        self.appBar.btnBack.addGestureRecognizer(gesture)
    }
    
    @objc func clickAction(sender : UITapGestureRecognizer) {
      
        switch sender.view {
          case appBar.btnBack:
              print("tapped Image View 1") //add your actions here
              navigationController?.popViewController(animated: true)
    
          default:
              print("Tap not detected")
          
           
          }
        
    
        
    }
    
    func updateUIView(_ webView: WKWebView) {
        guard let path: String = Bundle.main.path(forResource: "index1", ofType: "html") else { return }
        let localHTMLUrl = URL(fileURLWithPath: path, isDirectory: false)
        webView.loadFileURL(localHTMLUrl, allowingReadAccessTo: localHTMLUrl)
        
        webView.configuration.userContentController.add(self, name: "bridge")
    }
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
                    let date = Date()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.messageToWebview(msg: "hello, I got your messsage: \(message.body) at \(date)")
                    }
    }

    
    func messageToWebview(msg: String) {
               self.webview?.evaluateJavaScript("webkit.messageHandlers.bridge.onMessage('\(msg)')")
           }
    
    
    
       
        
      

}

extension CommonWebVC  {
    
    static func shareInstance() -> CommonWebVC
    {
        return CommonWebVC.initiateFromStoryboard(name: "HomeModule")
    }
}

