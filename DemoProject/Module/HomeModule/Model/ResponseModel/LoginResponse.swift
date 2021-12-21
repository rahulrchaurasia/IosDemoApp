//
//  LoginResponse.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 15/03/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import Foundation
// MARK: - LoginResponse
struct LoginResponse: Codable {
    let message, status: String
    let statusCode: Int
    let data: [LoginData]

    enum CodingKeys: String, CodingKey {
        case message, status
        case statusCode = "status_code"
        case data = "Data"
    }
}

// MARK: - Datum
// Mark :  [Userdetail]? : show that Data may come null which is handle by ? otherwise its expect data
struct LoginData: Codable {
    let userdetails: [Userdetail]?
    let orderstatuslist: [Orderstatuslist]
}

// MARK: - Orderstatuslist
struct Orderstatuslist: Codable {
    let id: Int
    let orderStatus: String

    enum CodingKeys: String, CodingKey {
        case id
        case orderStatus = "order_status"
    }
}

// MARK: - Userdetail
struct Userdetail: Codable {
    let userID: Int
    let name, email, mobile: String
    let userTypeID: Int
    let vehicleno, model, cityid, seriesno: String
    let rtoid, make: String
    let isgoldverify, version: String
    var activation_code : String?
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case name, email, mobile
        case userTypeID = "user_type_id"
        case vehicleno, model, cityid, seriesno, rtoid, make, isgoldverify, activation_code,version
    }
}
