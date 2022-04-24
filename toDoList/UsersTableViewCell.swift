//
//  UsersTableViewCell.swift
//  toDoList
//
//  Created by Алексей Каземиров on 4/21/22.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    func configure(with user: Users) {
        loginLabel.text = user.login
        passwordLabel.text = user.password
    }
}

extension UITableViewCell {
    
    static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
    
    
}
