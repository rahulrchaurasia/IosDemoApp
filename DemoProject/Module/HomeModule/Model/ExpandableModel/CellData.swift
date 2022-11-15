//
//  CellData.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 11/11/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import Foundation

struct cellData{
    
    var opened = Bool()
    var title = String()
    var sectionData = [childData]()   //Child
    
    
}

struct childData{
    
    var subtitle = String()
}
