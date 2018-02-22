//
//  DBService+Users.swift
//  SwiftFlashCards
//
//  Created by Lisa J on 2/15/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension DBService {
    public func addUser(userBio: String?, image: UIImage) {
        let childByAutoId = DBService.manager.getUsers().childByAutoId()
        childByAutoId.setValue(["userID"       : AuthUserService.getCurrentUser()!.uid,
                                "userDBid"     : childByAutoId.key,
                                "username"     : AuthUserService.getCurrentUser()!.displayName!,
                                "userBio"      : "",
                                "userImageStr" : "",
                                "userFlagCount": 0]) { (error, dbRef) in
                                    if let error = error {
                                        print("addUser error: \(error.localizedDescription)")
                                    } else {
                                        print("user added @ database reference: \(dbRef)")
                                    }
        }
    }
    
    public func updateUserName(userID: String, username: String) {
        DBService.manager.getUsers().child(userID).updateChildValues(["username": username])
    }
    
    public func updateUserHeadline(userID: String, userBio: String) {
        DBService.manager.getUsers().child(userID).updateChildValues(["userBio": userBio])
    }
    
    public func updateUserImage(userID: String, userImageStr: String) {
        DBService.manager.getUsers().child(userID).updateChildValues(["userImageStr": userImageStr])
    }
    
    
    public func loadAllUsers(completionHandler: @escaping ([SwiftFlashCardUser]?) -> Void) {
        let ref = DBService.manager.getUsers()
        ref.observe(.value) { (snapshot) in
            var allUsers = [SwiftFlashCardUser]()
            for child in snapshot.children {
                let dataSnapshot = child as! DataSnapshot
                if let dict = dataSnapshot.value as? [String: Any] {
                    let user = SwiftFlashCardUser.init(dict: dict)
                    allUsers.append(user)
                }
            }
            completionHandler(allUsers)
        }
    }
    
    
}


