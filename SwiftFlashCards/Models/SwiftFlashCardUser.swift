//
//  SwiftUser.swift
//  SwiftFlashCards
//
//  Created by Lisa J on 2/15/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

struct SwiftFlashCardUser {
    let userID: String
    let userDBid: String
    let username: String
//    let userBio: String
//    let userImageStr: String?
//    let userFlagCount: Int
    
    init(dict: [String : Any]) {
        userID = dict["userID"] as? String ?? ""
        userDBid = dict["userDBid"] as? String ?? ""
        username = dict["username"] as? String ?? ""
//        userBio = dict["userBio"] as? String ?? ""
//        userImageStr = dict["userImageStr"] as? String ?? ""
//        userFlagCount = dict["userFlagCount"] as? Int ?? 0
    }
}
