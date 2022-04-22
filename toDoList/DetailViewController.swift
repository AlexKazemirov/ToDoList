//
//  DetailViewController.swift
//  toDoList
//
//  Created by Алексей Каземиров on 4/23/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var users: Users!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginLabel.text = users.login
        passwordLabel.text = users.password
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
