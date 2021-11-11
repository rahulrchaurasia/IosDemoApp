//
//  Connectivity.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 25/06/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//



import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    
    
    static let message = "No Internet Access Available"
}

