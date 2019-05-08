//
//  ContactViewController.swift
//  FlickrCollection
//
//  Created by Nurzhigit Smailov on 3/26/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    let viewModel = ContactViewModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bindModel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewModel.getContacts()
            print(self.viewModel.contacts[0])
        }
    }
    func bindModel(){
        viewModel.delegate = self
        viewModel.didGetContacts = { [weak self] in
            print(self!.viewModel.contacts.count)
        }
    }
    
}

extension ContactViewController: ContactViewModelDelegate {
    func didGetContact() {
//        print(self.viewModel.contacts.count)
    }
}
