//
//  ViewA.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 26/10/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import SwiftUI

struct ViewA: View {
    var body: some View {
       
        ZStack {
            Color.red
            Image(systemName: "phone.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
            
        }
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}
