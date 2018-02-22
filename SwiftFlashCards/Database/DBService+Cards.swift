//
//  DBService+Cards.swift
//  SwiftFlashCards
//
//  Created by Lisa J on 2/18/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation
import Firebase

extension DBService {
    public func addCards(cardID: String, userID: String, question: String, category: String, answer: String, username: String) {
        let childByAutoId = DBService.manager.getCards().childByAutoId()
        childByAutoId.setValue(["cardID" : childByAutoId.key,
                                "userID ": AuthUserService.getCurrentUser()?.uid,
                                "question" : question,
                                "category" : category,
                                "answer" : answer,
                                "username" : username]) {(error, dbRef) in
                                    if let error = error {
                                        print("addCards error: \(error)")
                                    } else {
                                        print("cards added @ databaseref: \(dbRef)")
                                    }
                                    
        }
    }
    
    public func loadAllCards(completionHandler: @escaping ([Card]?) -> Void) {
        let ref = DBService.manager.getCards()
        ref.observe(.value) { (snapshot) in
            var allCards = [Card]()
            for child in snapshot.children {
                let dataSnapshot = child as! DataSnapshot
                   if let dict = dataSnapshot.value as? [String: Any] {
                    let card = Card.init(dict: dict)
                        allCards.append(card)
                    
                }
                
            }
            completionHandler(allCards)
            
        }
    }
    
    public func loadUserCards(){
        
    }
}
