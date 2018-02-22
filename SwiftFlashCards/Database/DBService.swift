//
//  DBService.swift
//  GoogleToolboxForMac
//
//  Created by Lisa J on 2/15/18.
//

import Foundation
import FirebaseDatabase

class DBService {
    
    //MARK: Properties
    private var dbRef: DatabaseReference!
    private var usersRef: DatabaseReference!
    private var cardsRef: DatabaseReference!
    private var categoriesRef: DatabaseReference!
    private var imagesRef: DatabaseReference!
    
    
    private init(){
        // reference to the root of the Firebase database
        dbRef = Database.database().reference()
        
        // children of root database node
        usersRef = dbRef.child("users")
        cardsRef = dbRef.child("posts")
        categoriesRef = dbRef.child("categories")
        imagesRef = dbRef.child("images")
    }
    static let manager = DBService()
    
    public func formatDate(with date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, YYYY h:mm a"
        return dateFormatter.string(from: date)
    }
    
    public func getDB()-> DatabaseReference { return dbRef }
    public func getUsers()-> DatabaseReference { return usersRef }
    public func getCards()-> DatabaseReference { return cardsRef }
    public func getCategories()-> DatabaseReference { return categoriesRef }
    public func getImages()-> DatabaseReference { return imagesRef }
}
