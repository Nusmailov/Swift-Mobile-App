//
//  ContactViewModel.swift
//  FlickrCollection
//
//  Created by Nurzhigit Smailov on 3/26/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation

protocol ContactViewModelDelegate: class {
    func didGetContact()
}

class ContactViewModels {
    var contacts: [Contact] = []
    var didGetContacts: (() -> ()) = { }
    weak var delegate: ContactViewModelDelegate?
    
    func getContacts() {
        contacts = [
            Contact.init(name: "Lol", surname: "Lol", phone: "Lol"),
            Contact.init(name: "Lol", surname: "Lol", phone: "Lol"),
            Contact.init(name: "Lol", surname: "Lol", phone: "Lol"),
            Contact.init(name: "Lol", surname: "Lol", phone: "Lol")
        ]
        delegate?.didGetContact()
        didGetContacts()
    }
    
}
