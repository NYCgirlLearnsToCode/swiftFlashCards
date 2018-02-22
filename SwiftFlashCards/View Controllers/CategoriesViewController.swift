//
//  CategoriesViewController.swift
//  SwiftFlashCards
//
//  Created by Lisa J on 2/17/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit
import Firebase

class CategoriesViewController: UIViewController {
   
    let categoriesView = CategoriesView()
    
    private var currentAuthUser:User!
    private var currentUser: SwiftFlashCardUser! {
        didSet { categoriesView.configureCategoryView(user: currentUser) }
    }
    private var textFieldText = ""
    private var currentUserCategories = [Category]() {
        didSet {
            DispatchQueue.main.async {
                self.categoriesView.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentAuthUser = AuthUserService.getCurrentUser()
        loadCurrentUser()
        loadCurrentUserCategories()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(categoriesView)
        categoriesView.tableView.delegate = self
        categoriesView.tableView.dataSource = self
        categoriesView.tableView.rowHeight = 50
        configureNavBar()

    }
    
    private func configureNavBar() {
        navigationItem.title = "Categories"
        let addBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCategory))
        navigationItem.rightBarButtonItem = addBarItem
    }
    
    private func loadCurrentUser() {
        DBService.manager.loadAllUsers{(users) in
            if let users = users {
                for user in users {
                    if self.currentAuthUser.uid == user.userID
                        { self.currentUser = user }
                    print(self.currentAuthUser.uid,user.userID)
                }
            } else {print("error loading users")}
        }
    }
    
    private func loadCurrentUserCategories() {
        DBService.manager.loadUserCategories(userID: (currentAuthUser?.uid)!) { (categories) in
            if let categories = categories {self.currentUserCategories = categories}
            else {print("Error loading user categories")}
        }
    }
    
    private func showAlertWithTextInput(completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "Title", message: "message", preferredStyle: .alert)
        alert.addTextField {(textField) in
            textField.text = "default text"
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            self.textFieldText = (textField?.text)!
            print("Text field: \(self.textFieldText)")
            completion?()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc private func addCategory() {
        let currentUser = AuthUserService.getCurrentUser()
//        let childByAutoId = DBService.manager.getCategories().childByAutoId()
//        let randomCategoryId = childByAutoId.key
        showAlertWithTextInput(completion:
            {DBService.manager.addCategory(userID: (currentUser?.uid)!, category: self.textFieldText, username: AuthUserService.getCurrentUser()!.displayName!)}
        )
    }
}
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentUserCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = currentUserCategories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category Cell", for: indexPath) as! CategoryTableViewCell
        cell.textLabel?.text = category.category
        cell.userNameLabel.text = category.username
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = currentUserCategories[indexPath.row]
        let cardsViewController = CardsViewController()
        self.navigationController?.pushViewController(cardsViewController, animated: true)
        
    }
}
