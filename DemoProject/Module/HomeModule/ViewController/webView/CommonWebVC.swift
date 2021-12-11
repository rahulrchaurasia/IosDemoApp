//
//  CommonWebVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 16/11/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit
import WebKit

class CommonWebVC: UIViewController , WKNavigationDelegate, WKScriptMessageHandler {
  
    

    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIView(webview)
       

       // webview.load(URLRequest(url: URL(string: "https://www.google.com")!))
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

