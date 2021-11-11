//
//  MenuDb.swift
//  DemoProject
//
//  Created by Daniyal Shaikh on 24/03/21.
//  Copyright © 2021 Nilesh Birhade. All rights reserved.
//

import Foundation

class MenuDb {
    
    static let shareInstance = MenuDb()
    
    var Menulist =  [MenuModel]()
    
    var menuSectionlist = [MenuSection]()
    
    
    
    func getMenuSection() ->  [MenuSection]{
        
        // Here Section is 3 ie "MenuSection" And Row count of each Section represent by "menuModel"
        menuSectionlist.removeAll()
        menuSectionlist.append(MenuSection(section: "Home",menuModel: getHomeMenuData()))
        menuSectionlist.append(MenuSection(section: "Buisness",menuModel: getBuissnessMenuData()))
        menuSectionlist.append(MenuSection(section: "Inventory",menuModel: getInventortMenuData()))
        return menuSectionlist
    }
    
    
    func  getHomeMenuData() ->  [MenuModel]
    {
        Menulist =  [MenuModel]()
        Menulist.append(MenuModel(name: "Home" ,img: "home1", modelId: 1))
        Menulist.append(MenuModel(name: "Constrain Layout",img: "home1", modelId: 2))
        Menulist.append(MenuModel(name: "Home Data2",img: "home1", modelId: 3))
        Menulist.append(MenuModel(name: "Home Data3",img: "home1", modelId: 4))
        Menulist.append(MenuModel(name: "Home Data4",img: "home1" ,modelId: 5))
        Menulist.append(MenuModel(name: "Home Data5",img: "home1" ,modelId: 6))
        Menulist.append(MenuModel(name: "Home Data6",img: "home1" ,modelId: 7))
        return Menulist
    }
    
    
    func  getBuissnessMenuData() ->  [MenuModel]
    {
        Menulist =  [MenuModel]()
        Menulist.append(MenuModel(name: "Buissness" ,img: "ic_business_name" ,modelId: 101))
        Menulist.append(MenuModel(name: "Buissness Data1",img: "ic_business_name" ,modelId: 102))
        Menulist.append(MenuModel(name: "Buissness Data2",img: "ic_business_name" ,modelId: 103))
        Menulist.append(MenuModel(name: "Buissness Data3",img: "ic_business_name" ,modelId: 104))
        Menulist.append(MenuModel(name: "Buissness Data4",img: "ic_business_name" ,modelId: 105))
        Menulist.append(MenuModel(name: "Buissness Data5",img: "ic_business_name" ,modelId: 106))
        Menulist.append(MenuModel(name: "Buissness Data6",img: "ic_business_name" ,modelId: 107))
        
        Menulist.append(MenuModel(name: "Buissness Data7",img: "ic_business_name"  ,modelId: 108))
        Menulist.append(MenuModel(name: "Buissness Data8",img: "ic_business_name" ,modelId: 109))
        Menulist.append(MenuModel(name: "Buissness Data9",img: "ic_business_name" ,modelId: 110))
        
        return Menulist
    }
    
    
    func  getInventortMenuData() ->  [MenuModel]
    {
        Menulist =  [MenuModel]()
        Menulist.append(MenuModel(name: "Inventory" ,img: "generateInvoice" ,modelId: 201))
        Menulist.append(MenuModel(name: "Inventory Data1",img: "generateInvoice" ,modelId: 202))
        Menulist.append(MenuModel(name: "Inventory Data2",img: "generateInvoice" ,modelId: 203))
        Menulist.append(MenuModel(name: "Inventory Data3",img: "generateInvoice" ,modelId: 204))
        Menulist.append(MenuModel(name: "Logout",img: "logout" ,modelId: 205))
    
        return Menulist
    }
    
}
