//
//  UserDefault.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 26/06/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import Foundation


struct Defaults {
    
    static let (nameKey, addressKey) = ("name", "address")
    static let userDataKey = "com.save.usersession"
    private static let userDefault = UserDefaults.standard
    
    /**
     - Description - It's using for the passing and fetching
     user values from the UserDefaults.
     
     
     */
    
    static func saveLoginEntity(userdetails : Userdetail ){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(userdetails) {
            
            userDefault.set(encoded, forKey: userDataKey)
        }
    }
    
    static func getLoginEntity()-> Userdetail? {
        // return UserDetails((userDefault.value(forKey: userSessionKey) as? [String: String]) ?? [:])
        
        
        if let userData = UserDefaults.standard.object(forKey: Defaults.userDataKey) as? Data {
            let decoder = JSONDecoder()
            if let loginEntity = try? decoder.decode(Userdetail.self, from: userData) {
                
                return loginEntity
            }
            
        }
         return nil
        
        
    }
    
    static func isLogin() -> Bool {
        
        if(getLoginEntity() == nil){
            return false
        }else{
            
            return true
        }
    }
    
    static func clearUserData(){
        
        userDefault.removeObject(forKey: userDataKey)
      // userDefault.dictionaryRepresentation().keys.forEach(defaults.removeObject(forKey:))
    }
    
    static func resetDefaults() {
           let defaults = UserDefaults.standard
           // let dictionary = defaults.dictionaryRepresentation()
           defaults.dictionaryRepresentation().keys.forEach(defaults.removeObject(forKey:))
          
    }
    
    
}
