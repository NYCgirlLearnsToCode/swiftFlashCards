//
//  DBService+Categories.swift
//  SwiftFlashCards
//
//  Created by Lisa J on 2/19/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation
import Firebase

extension DBService {
    public func addCategory(userID: String, category: String, username: String) {
        let childByAutoId = DBService.manager.getCategories().childByAutoId()
        childByAutoId.setValue(["categoryID" : childByAutoId.key,
                                "userID" : AuthUserService.getCurrentUser()!.uid,
                                "category" : category,
                                "username" : username]) {(error, dbRef) in
                                    if let error = error {
                                        print("addCategory error: \(error)")
                                    } else {
                                        print("category added @ database reference: \(dbRef)")
                                    }
        }
    }
    
    public func loadAllCategories(completionHandler: @escaping ([Category]?) -> Void) {
        let ref = DBService.manager.getCategories()
        ref.observe(.value) { (snapshot) in
            var allCategories = [Category]()
            for child in snapshot.children {
                let dataSnapshot = child as! DataSnapshot
                if let dict = dataSnapshot.value as? [String: Any] {
                    let category = Category.init(dict: dict)
                    allCategories.append(category)
                }
            }
            completionHandler(allCategories)
        }
    }
    
    public func loadUserCategories(userID: String, completionHandler: @escaping ([Category]?) -> Void) {
        let ref = DBService.manager.getCategories()
        ref.observe(.value) {(snapshot) in
            var userCategories = [Category]()
            for child in snapshot.children {
                let dataSnapshot = child as! DataSnapshot
                if let dict = dataSnapshot.value as? [String : Any] {
                    let category = Category.init(dict: dict)
                    if userID == category.userID {
                        userCategories.append(category)
                    }
                }
            }
            completionHandler(userCategories)
        }
    }
}
