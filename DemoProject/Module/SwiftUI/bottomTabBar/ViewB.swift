//
//  ViewB.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 26/10/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import SwiftUI

struct ViewB: View {
    var body: some View {
        ZStack {
            Color.blue
            Image(systemName: "person.2.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
            
        }
    }
}

struct ViewB_Previews: PreviewProvider {
    static var previews: some View {
        ViewB()
    }
}
