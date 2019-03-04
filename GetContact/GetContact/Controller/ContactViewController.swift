//
//  ContactViewController.swift
//  GetContact
//
//  Created by Nurzhigit Smailov on 2/28/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var contacts = [Contact]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fillOutContact()
        tableView.tableFooterView = UIView(frame: .zero)
        let addButton = UIBarButtonItem.init(title: "Add", style: .done, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    @objc func addTapped() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "AddContactViewController") as! AddContactViewController
        controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func fillOutContact(){
        contacts.append(Contact(name: "Nurzhigt", lastname: "Smailov", phone: "+77071969686", tag: .blue))
        contacts.append(Contact(name: "Alisher", lastname: "Qalqa", phone: "+77079812893", tag: .green))
        contacts.append(Contact(name: "Elibay", lastname: "Poltos", phone: "+77079812893", tag: .blue))
        contacts.append(Contact(name: "Askhat", lastname: "Borya", phone: "+77079812893", tag: .blue))
    }
    
}


extension ContactViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 60
        if let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath) as?  ContactTableViewCell{
            cell.generateCell(contact: contacts[indexPath.row])
            return cell
        }
        return ContactTableViewCell()
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

extension ContactViewController : AddContactDelegate {
    func didCreateContact(contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
}


