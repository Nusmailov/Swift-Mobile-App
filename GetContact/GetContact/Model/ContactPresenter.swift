//
//  ContactPresenter.swift
//  GetContact
//
//  Created by Nurzhigit Smailov on 3/11/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation

class ContactPresenter{
    public weak var view: ContactView?
    var contacts = [Contact]()
    func getContacts(){
        view?.showLoading()
        contacts.append(Contact(name: "Nurzhigt", lastname: "Smailov", phone: "+77071969686", tag: .blue))
        contacts.append(Contact(name: "Alisher", lastname: "Qalqa", phone: "+77079812893", tag: .green))
        contacts.append(Contact(name: "Elibay", lastname: "Poltos", phone: "+77079812893", tag: .blue))
        contacts.append(Contact(name: "Askhat", lastname: "Borya", phone: "+77079812893", tag: .blue))
        view?.hideLoading()
        view?.showContacts(contacts: contacts)
    }
    
}
protocol ContactView: BaseView {
    func showContacts(contacts: [Contact])
}

protocol  BaseView: class{
    func showLoading()
    func hideLoading()
    func showError(message: String)
}
