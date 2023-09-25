//
//  DismissKeyboardOnTap.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 24/05/23.
//  Copyright © 2023 Nilesh Birhade. All rights reserved.
//

import Foundation
import SwiftUI

//cece
struct DismissKeyboardOnTap: ViewModifier {
    @State private var isKeyboardVisible: Bool = false
    
    func body(content: Content) -> some View {
         content
             .onTapGesture {
                 UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true)
                
             }
             .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                 withAnimation {
                     isKeyboardVisible = true
                 }
             }
             .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                 withAnimation {
                     isKeyboardVisible = false
                 }
             }
             .ignoresSafeArea(.keyboard, edges: .bottom)
     }
}
