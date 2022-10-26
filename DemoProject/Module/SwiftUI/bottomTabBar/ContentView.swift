//
//  ContentView.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 26/10/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            
            ViewA()
                .tabItem(){
                    Image(systemName: "phone.fill")
                    Text("Calls")
                }
            ViewB()
                .tabItem(){
                    Image(systemName: "person.2.fill")
                    Text("Calls")
                }
            ViewC()
                .tabItem(){
                    Image(systemName: "slider.horizontal.3")
                    Text("Calls")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
