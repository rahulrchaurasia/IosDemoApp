//
//  APIManager.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 12/03/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import Foundation
import  Alamofire


enum APIErrors : Error {
    
    case custom(message : String)
    
              
}

typealias Handler = (Swift.Result<Any?, APIErrors>) -> Void

class APILoginManger {
    
    static let shareInstance = APILoginManger()
    
    class func headers() -> HTTPHeaders
    {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        return headers
    }
    
    func loginAPI1(login : LoginModel,completionHandler: @escaping (Bool) -> () ){
        
        let headers : HTTPHeaders = [
            
            .contentType( "application/json")
        ]
        
        AF.request(login_url, method: .post, parameters: login,
                   encoder: JSONParameterEncoder.default, headers: headers).response{ response in
                    // debugPrint(response)
                    switch response.result {
                        
                        
                    case .success(let data):
                        do{
                            
                            let loginData = try JSONDecoder().decode(LoginResponse.self, from: data!)
                            print("-------SUCCESSS -------" + String((loginData.data[0].userdetails?[0].name ?? "")))
                            
                            if(response.response?.statusCode == 200 ){
                                
                                completionHandler(true)
                            }else{
                                
                                completionHandler(false)
                            }
                        }catch{
                            print("failure")
                            completionHandler(false)
                        }
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                        completionHandler(false)
                    }
                    
                    
        }
    }
    
    
    
    
    // Mark : API Calling
    
    func loginAPI(login : LoginModel, completionHandler : @escaping Handler){
           
           let headers : HTTPHeaders = [
               
               .contentType( "application/json")
           ]
           
        AF.request(login_url, method: .post, parameters: login,
                   encoder: JSONParameterEncoder.default, headers: headers).response{ response in
                     debugPrint(response)
                    switch response.result {
                        
                        
                    case .success(let data):
                        do{
                            
                            if(response.response?.statusCode == 200 ){
                              
                                let loginRespData = try JSONDecoder().decode(LoginResponse.self, from: data!)
                                
                               // print("-------SUCCESSS -------\(loginRespData.data[0].userdetails[0].name)")
                                                              
                                if( loginRespData.statusCode == 0){
                                    
                                   // MARK:-  Save object in UserDefault

                                    Defaults.saveLoginEntity(userdetails: loginRespData.data[0].userdetails![0])
                                    completionHandler(.success(loginRespData))
                                }else{
                                    
                                    completionHandler(.failure(.custom(message: loginRespData.message)))
                                }
                                

                            }else{
                                
                                 completionHandler(.failure(.custom(message: "Server error please Try Again")))
                                
                            }
                        }catch{
                            print("failure")
                            completionHandler(.failure(.custom(message: "Server error please Try Again")))
                        }
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                        completionHandler(.failure(.custom(message: error.localizedDescription)))
                    }
                    
                    
        }
    }
    
    // Mark : Refer
     
         func getShareData(prdID : String){
             
    //         if Connectivity.isConnectedToInternet()
    //         {
    //             print("internet is available.")
    //
    //         let alertView:CustomIOSAlertView = FinmartStyler.getLoadingAlertViewWithMessage("Please Wait...")
    //         if let parentView = self.navigationController?.view
    //         {
    //             alertView.parentView = parentView
    //         }
    //         else
    //         {
    //             alertView.parentView = self.view
    //         }
    //         alertView.show()
    //
    //        let FBAId = UserDefaults.standard.string(forKey: "FBAId")
    //         let POSPNo = UserDefaults.standard.string(forKey: "POSPNo")
    //
    //         let parameter  :[String: AnyObject] = [
    //             "ss_id": POSPNo as AnyObject,
    //             "fba_id": FBAId as AnyObject,
    //             "product_id": prdID as AnyObject,
    //             "sub_fba_id":"0" as AnyObject
    //         ]
    //          let endUrl = "/api/GetShareUrl"
    //         let url =  FinmartRestClient.baseURLString  + endUrl
    //      Alamofire.request(url, method: .post, parameters: parameter,encoding: JSONEncoding.default,headers: FinmartRestClient.headers).responseJSON(completionHandler: { (response) in
    //         switch response.result {
    //
    //
    //             case .success(let value):
    //
    //                 alertView.close()
    //
    //                 self.view.layoutIfNeeded()
    //                 guard let data = response.data else { return }
    //                 do {
    //                     let decoder = JSONDecoder()
    //                     let shareModel = try decoder.decode(SharePrdModel.self, from: data)
    //
    //                     print("Share ",shareModel.MasterData.msg + shareModel.MasterData.url)
    //
    //                     let strbody = shareModel.MasterData.msg + "\n" + shareModel.MasterData.url
    //                     self.shareTextData(strBody: strbody)
    //
    //                 } catch let error {
    //                     print(error)
    //                     alertView.close()
    //
    //                     let snackbar = TTGSnackbar.init(message: error as! String, duration: .long)
    //                     snackbar.show()
    //                 }
    //
    //
    //             case .failure(let error):
    //                 print(error)
    //                  alertView.close()
    //                 let snackbar = TTGSnackbar.init(message: error as! String, duration: .long)
    //                 snackbar.show()
    //             }
    //         })
    //
    //         }else{
    //             let snackbar = TTGSnackbar.init(message: Connectivity.message, duration: .middle )
    //             snackbar.show()
    //         }
    //
    //
         }


}
