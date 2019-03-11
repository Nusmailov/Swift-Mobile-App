//
//  AddContactViewController.swift
//  GetContact
//
//  Created by Nurzhigit Smailov on 2/28/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

protocol AddContactDelegate {
    func didCreateContact(contact: Contact)
}

class AddContactViewController: UIViewController {
    var delegate: AddContactDelegate?
    var colors  = ["green", "red", "blue", "yellow", "orange", "gray"]
    fileprivate let cellId = "colorCell"
    
    var tagPicker: UITextField!
    var firstnameField: UITextField!
    var phoneField: UITextField!
    var lastnameField: UITextField!
    
    var defaults = UserDefaults.standard
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupFields()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Add", style: .done, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        guard firstnameField.text != "" else {
            let alert = UIAlertController.init(title: "Error", message: "Fill out your name", preferredStyle: .alert)
            let okButton = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard phoneField.text != "" else {
            let alert = UIAlertController.init(title: "Error", message: "Fill out your phone", preferredStyle: .alert)
            let okButton = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            return
        }
        let contact = Contact.init(name: firstnameField.text ?? "", lastname: lastnameField.text ?? "", phone: phoneField.text ?? "")
        delegate?.didCreateContact(contact: contact)
        self.navigationController?.popViewController(animated: true)
    }
    
    fileprivate func setupCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 300, left: 30, bottom: 0, right:30)
        layout.itemSize = CGSize(width: 40, height: 40)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(collectionView)
    }
    
    fileprivate func setupFields(){
        let y = (self.navigationController?.navigationBar.frame.maxY)! + 30
        firstnameField = UITextField(frame: CGRect(x: 10, y: y + 10, width: view.frame.width - 20, height: 40))
        firstnameField.borderStyle = UITextField.BorderStyle.roundedRect
        firstnameField.placeholder = "First Name"
        view.addSubview(firstnameField)
        
        lastnameField = UITextField(frame: CGRect(x: 10, y: y + 60, width: view.frame.width - 20, height: 40))
        lastnameField.borderStyle = UITextField.BorderStyle.roundedRect
        lastnameField.placeholder = "Last Name"
        view.addSubview(lastnameField)
        
        phoneField = UITextField(frame: CGRect(x: 10, y: y + 110, width: view.frame.width - 20, height: 40))
        phoneField.borderStyle = UITextField.BorderStyle.roundedRect
        phoneField.placeholder = "Phone"
        phoneField.keyboardType = .namePhonePad
        view.addSubview(phoneField)
    }
    func getColor(item: Int) -> UIColor{
        switch item {
        case 0:
            return UIColor.yellow
        case 1:
            return UIColor.blue
        case 2:
            return UIColor.orange
        case 3:
            return UIColor.green
        case 4:
            return UIColor.red
        case 5:
            return UIColor.gray
        default:
            UIColor.yellow
        }
        return UIColor.yellow
    }
}

extension AddContactViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ColorCollectionViewCell
        cell.backgroundColor = getColor(item: indexPath.item)
        cell.layer.cornerRadius = min(cell.frame.size.height, cell.frame.size.width) / 2.0
        cell.layer.masksToBounds = true
        return cell
    }
}
