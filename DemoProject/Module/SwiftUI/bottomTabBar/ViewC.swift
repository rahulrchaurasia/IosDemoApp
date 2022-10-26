//
//  ViewC.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 26/10/22.
//  Copyright © 2022 Nilesh Birhade. All rights reserved.
//

import SwiftUI

struct ViewC: View {
    var body: some View {
        ZStack {
            Color.green
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
            
        }
    }
}

struct ViewC_Previews: PreviewProvider {
    static var previews: some View {
        ViewC()
    }
}
