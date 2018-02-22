//
//  Card.swift
//  SwiftFlashCards
//
//  Created by Lisa J on 2/18/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

class Card {
    let cardID: String
    let userID: String
    let question: String
    let category: String
    let answer: String
    let username: String
    
    init(dict: [String : Any]) {
        self.cardID = dict["cardID"] as? String ?? ""
        self.userID = dict["userID"] as? String ?? ""
        self.question = dict["question"] as? String ?? ""
        self.category = dict["category"] as? String ?? ""
        self.answer = dict["answer"] as? String ?? ""
        self.username = dict["username"] as? String ?? ""
    }
}
