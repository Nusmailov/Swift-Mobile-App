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
    var defaults = UserDefaults.standard
    private let cellReuseIdentifier = "collectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        
        let addButton = UIBarButtonItem.init(title: "Add", style: .done, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func addTapped() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "AddContactViewController") as! AddContactViewController
        controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    func loadFromDefaults(){
        let decoded = defaults.object(forKey: "savedContacts") as! Data
        self.contacts = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Contact]
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
