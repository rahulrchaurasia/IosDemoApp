//
//  Extension+View.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 24/05/23.
//  Copyright © 2023 Nilesh Birhade. All rights reserved.
//

import Foundation
import SwiftUI

// @FocusState  : we can use directly
//starting with iOS 15 we can now use @FocusState to control which field should be focused (see this answer to see more examples).
extension View {
    func dismissKeyboardOnTap() -> some View {
        self.modifier(DismissKeyboardOnTap())
    }
}
