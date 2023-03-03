//
//  Extension+String.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 03/03/23.
//  Copyright © 2023 Nilesh Birhade. All rights reserved.
//

import Foundation

extension String {
    
    //without removing spaces between words
    var removeSpecialCharacters: String {
        return self.components(separatedBy: CharacterSet.alphanumerics.inverted).filter({ !$0.isEmpty }).joined(separator: " ")
    }
    
    
    var removeSpecialCharactersWithoutSpace: String {
        return self.components(separatedBy: CharacterSet.alphanumerics.inverted).filter({ !$0.isEmpty }).joined()
    }
    
}
