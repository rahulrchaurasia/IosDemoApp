//
//  MenuModel.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 24/03/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import Foundation

struct MenuModel {

     var mId : Int
    var mName : String
    var mImg : String
    

    init(name :String,img :String,modelId : Int) {
        mName = name
        mImg = img
        mId = modelId
    }
}


// MARK: - MenuSection
struct MenuSection {
    var section: String
    var isExpanded : Bool
    var menuModel: [MenuModel]

    init(section: String, menuModel: [MenuModel]) {
        self.section = section
        self.menuModel = menuModel
        self.isExpanded = true
    }
}


