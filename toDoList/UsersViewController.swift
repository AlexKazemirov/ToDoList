//
//  UsersViewController.swift
//  toDoList
//
//  Created by Алексей Каземиров on 4/21/22.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var users: [Users] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users.append(Users(login: "Alex", password: "123"))
        users.append(Users(login: "John", password: "245"))
        users.append(Users(login: "Mila", password: "580"))
        users.append(Users(login: "Alex", password: "123"))
        users.append(Users(login: "John", password: "245"))
        users.append(Users(login: "Alex", password: "123"))
        users.append(Users(login: "John", password: "245"))
        users.append(Users(login: "Alex", password: "123"))
        users.append(Users(login: "John", password: "245"))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UsersTableViewCell.cellNib(), forCellReuseIdentifier: UsersTableViewCell.cellIdentifier())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.cellIdentifier(), for: indexPath) as! UsersTableViewCell

        let model = users[indexPath.row]
        
        cell.configure(with: model) 
        
        return cell
    }
    
}
