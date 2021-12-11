//
//  WebViewVC.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 16/11/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import UIKit
import WebKit
class WebViewVC: UIViewController,  WKNavigationDelegate ,UIDocumentInteractionControllerDelegate{
  
  
    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        bindURL()
    }
    
 
    @IBAction func btnShareClick(_ sender: UIBarButtonItem) {
        
        let str = "http://horizon.policyboss.com:5000/tmp/fm_quoteshare/4732631_1_1711202184218.pdf"
        generatePdf(strUrl: str)
    }
    
    func bindURL(){
        
        
        //let insURL = "http://elite.interstellar.co.in/iostest.html"
       // let insURL = "http://elite.interstellar.co.in/iostestnew.html"
        
        let insURL =  "http://origin-cdnh.policyboss.com/fmweb/motor/tw-main-page.html?ss_id=8145&fba_id=5631&v=20200609&sub_fba_id=0&ip_address=10.0.0.1&mac_address=10.0.0.1&app_version=1.0.1&product_id=1&device_id=594ad17c0ec7fd1e&login_ssid="
       
        webview.navigationDelegate =  self
        webview.configuration.preferences.javaScriptEnabled = true
        
         webview.load(URLRequest(url: URL(string: insURL)!))
        
//        let str = "http://horizon.policyboss.com:5000/tmp/fm_quoteshare/4732631_1_1711202184218.pdf"
//
//        let urlPDF :URL = URL(string: str)!
//        webview.load(URLRequest(url: urlPDF))
//
        
       
      
    }
    
   
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print("\(#function)")

        // Check whether WebView Native is linked
        if let url = navigationAction.request.url,
            let urlScheme = url.scheme,
            let urlHost = url.host,


            urlScheme.uppercased() == Constants.schemeKey.uppercased() {
            print("url:\(url)")
            print("urlScheme:\(urlScheme)")
            print("urlHost:\(urlHost)")

            decisionHandler(.cancel)

            var data = url.absoluteString.replacingOccurrences(of: "iosscheme://", with: "")
           
           
            data = data.replacingOccurrences(of: "http", with: "http:")
            print("urlPDF:\(data)")
          //  let str = "http://horizon.policyboss.com:5000/tmp/fm_quoteshare/4732631_1_1111202144851.pdf"
            generatePdf(strUrl: data)
            
            
            // call back!
            //  self.webview.stringByEvaluatingJavaScript(script: "javascript:testCallBack('\(urlHost)');")


//            webView.evaluateJavaScript("javascript:testCallBack('\(urlHost)');") { (result, error) in
//                if error == nil {
//                    print(result as Any)
//                }
//            }
           return
        }
        decisionHandler(.allow)
        
        

    }
  
    
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        
        return self
    }
    
    
    private func generatePdf(strUrl : String){
        
        
        self.showDialog(strTitle: "Please Wait!!")
        
        
        var filename = "Quote"
        
        let request = URLRequest(url:  URL(string: strUrl )!)
        let config = URLSessionConfiguration.default
        let session =  URLSession(configuration: config)
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
            if error == nil{
                if let pdfData = data {
                    let pathURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("\(filename).pdf")
                    do {
                        print("open \(pathURL.path)")
                        try pdfData.write(to: pathURL, options: .atomic)
                        
                        self.dismissDialog()
                    }catch{
                        print("Error while writting")
                        self.dismissDialog()
                    }
                    
                    DispatchQueue.main.async {
                        
                        self.sharePdf(path: pathURL)
                    }
                    
                    
                }
            }else{
                print(error?.localizedDescription ?? "")
                self.dismissDialog()
            }
        }); task.resume()
    }
    
    
    
    // Share Pdf Using Path
    func sharePdf(path:URL) {
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: path.path) {
            
            // Below is Default Sharing
            //            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [path], applicationActivities: nil)
            //            activityViewController.popoverPresentationController?.sourceView = self.view
            //            self.present(activityViewController, animated: true, completion: nil)
            
            // For Showing Preview
            
            let controller = UIDocumentInteractionController(url: path)
            controller.delegate = self
            controller.presentPreview(animated: true)
            
        }
    }
    
    
    
   

}

extension WebViewVC {
    
    static func shareInstance() -> WebViewVC
    {
        return WebViewVC.initiateFromStoryboard(name: "HomeModule")
    }
}
private struct Constants {
    //nativeScheme
   static let schemeKey = "iosscheme"
   // static let schemeKey = "nativeScheme"
}




// Note :--> urlScheme = "nativeiOSScheme://"  { required as key than add value which we required. }
/*
 
 
 <html lang="ko">
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 </head>

 <script type="text/javascript">
     //alert(2)
     /*
      var urlScheme = "nativeiOSScheme://productid-";
      
      function callNative01(id:"1234") {
      window.location = urlScheme.concat(id);
      }
      */
     function callNative01() {
         window.location = "nativeiOSScheme://1234";
     }

     function test02() {
         alert('test02');
     }

     function showProductPage(productid) {
         alert(productid);
     }
 </script>
 <body>
 <h1> <a href="javascript:test02();">Test Click</a> </h1> <br /><br />

 <h1> <a href="javascript:callNative01();">CallNative 01 Click</a> </h1> <br /><br />


 <h1> This is a sample file created to test a simple "WebView".<br /></h1>
 <h1> Modify this file to test the "WebView" content.<br /></h1>
 </body>
 </html>
 */
