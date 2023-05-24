//
//  DemoSwiftUIView1.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 24/05/23.
//  Copyright © 2023 Nilesh Birhade. All rights reserved.
//

import SwiftUI

// Overlay Demo
struct DemoSwiftUIView1: View {
    var body: some View {
           VStack {
               Text("Hello, SwiftUI!")
                   .font(.largeTitle)
                   .foregroundColor(.white)
                   .padding()
                   .background(Color.blue)
                   .cornerRadius(10)
                   .overlay(
                       Text("Overlay Text")
                           .font(.title)
                           .foregroundColor(.white)
                           .padding()
                           .background(Color.red)
                           .cornerRadius(5)
                   )
           }
       }
}

struct DemoSwiftUIView1_Previews: PreviewProvider {
    static var previews: some View {
        DemoSwiftUIView1()
    }
}
