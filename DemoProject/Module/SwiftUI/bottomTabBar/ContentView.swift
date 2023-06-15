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
        
        @State var username  = String()
        @State var  password = String()
        @Environment(\.presentationMode) var presentationMode
        
        //Mark: For Header Title
        VStack(alignment: .leading, spacing: 0){
            HStack(spacing: 0){
                
                Button {
                   presentationMode.wrappedValue.dismiss()
                    
                   // self.dismiss(animate: true)
                }
            label: {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 24))
                
                    .frame(width: 60, height: 40)
                    .foregroundColor(.blue)
            }.padding(.leading, 15)
                
                Text("Tab Bar Demo")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
            }
           
            TextField("Username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .onAppear {
                                IQKeyboardManager.shared.enable = true
                                IQKeyboardManager.shared.toolbarPreviousNextAllowedClasses = []
                                IQKeyboardManager.shared.toolbarTintColor = .blue
                                IQKeyboardManager.shared.shouldResignOnTouchOutside = true
                            }
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .padding(.leading,20)
           
            .padding(.leading, -20)
            
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
        .frame(maxWidth: .infinity)
        .background(Color.purple.opacity(0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
