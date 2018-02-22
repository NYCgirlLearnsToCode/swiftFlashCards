//
//  Category.swift
//  SwiftFlashCards
//
//  Created by Lisa J on 2/19/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

class Category {
    let categoryID: String
    let userID: String
    let category: String
    let username: String
    
    init(dict: [String : Any]) {
        self.categoryID = dict["categoryID"] as? String ?? ""
        self.userID = dict["userID"] as? String ?? ""
        self.category = dict["category"] as? String ?? ""
        self.username = dict["username"] as? String ?? ""
    }
}
