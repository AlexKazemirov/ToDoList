//
//  UsersTableViewController.swift
//  toDoList
//
//  Created by Алексей Каземиров on 4/21/22.
//

import UIKit

class UsersTableViewController: UITableViewController {

    var users: [Users] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users.append(Users(login: "Alex", password: "123"))
        users.append(Users(login: "John", password: "456"))
        users.append(Users(login: "Marta", password: "357"))
        users.append(Users(login: "Jack", password: "891"))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell", for: indexPath)
        
        let model = users[indexPath.row]
        cell.textLabel?.text = model.login
        cell.detailTextLabel?.text = model.password
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
