//
//  UserViewController.swift
//  FlickrCollection
//
//  Created by Nurzhigit Smailov on 3/9/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class UserViewController : UIViewController {
    
    let presenter  = UserPresenter()
    var users =  [User]()
    
    override func viewDidLoad() {
        presenter.view = self
        presenter.getUsers()
        
    }
}


extension UserViewController : UserView{
    
    func showUsers(users: [User]) {
        self.users = users
        for user in users{
            print(user.name)
        }
        
    }
    
    func showLoading() {
    }
    
    func hideLoading() {
    }
    
    func showError(message: String) {
        
    }
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        return cell
    }
    
}
