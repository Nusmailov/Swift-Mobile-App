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
    var colors  = ["green", "red", "blue", "yellow", "orange"]
    
    @IBOutlet weak var tagPicker: UITextField!
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem.init(title: "Add", style: .done, target: self, action: #selector(addTapped))
        self.navigationItem.rightBarButtonItem = addButton
        createPickerColor()
        dissmissKey()
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
        var tagger:TagColor
        switch tagPicker.text {
            case "green":
                tagger = TagColor.green
            case "red":
                tagger = TagColor.red
            case "blue":
                tagger = TagColor.blue
            case "yellow":
                tagger = TagColor.yellow
            case "orange":
                tagger = TagColor.orange
            default: tagger = TagColor.red
            
        }
        
        let contact = Contact.init(name: firstnameField.text ?? "", lastname: lastnameField.text ?? "", phone: phoneField.text ?? "", tag: tagger)
        delegate?.didCreateContact(contact: contact)
        
        //before
//        let decoded = defaults.object(forKey: "savedContacts") as! Data
//        var decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Contact]
//        decodedTeams.append(contact)
        //after
//        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: decodedTeams)
//        self.defaults.set(encodedData, forKey: "savedContacts")
//        self.defaults.synchronize()
        
        self.navigationController?.popViewController(animated: true)
    }
}


extension AddContactViewController: UIPickerViewDelegate, UIPickerViewDataSource,  UITextFieldDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = colors[row]
        tagPicker.text = selected
    }
    
    func createPickerColor(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        tagPicker.inputView = pickerView
    }
    func dissmissPicker(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dissmissKey))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        tagPicker.inputAccessoryView = toolBar
    }
    
    @objc func dissmissKey(){
//         view.endEditing(true)
    }
    
}
