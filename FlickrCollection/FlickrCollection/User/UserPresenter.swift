//
//  UserPresenter.swift
//  FlickrCollection
//
//  Created by Nurzhigit Smailov on 3/9/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation

class UserPresenter {
    public weak var view: UserView?
    
    func getUsers() {
        view?.showLoading()
        var users = [User]()
        users.append(User(name: "name1"))
        users.append(User(name: "name2"))
        users.append(User(name: "name3"))
        users.append(User(name: "name4"))
        view?.hideLoading()
        view?.showUsers(users: users)
        
    }
}

protocol UserView :  BaseView {
    func showUsers(users:[User])
}

struct User{
    let name:String
}


//for i in 0 ..< infoReceipt.count{
//    for j in infoReceipt[i].products{
//        sum += (j.price*j.procentCash)/100
//    }
//}
