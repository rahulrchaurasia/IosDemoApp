//
//  LoginModel.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 12/03/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import Foundation

struct LoginModel: Codable {
    let mobile ,password, device_id, device_token : String
    let user_type_id: String

   
}
