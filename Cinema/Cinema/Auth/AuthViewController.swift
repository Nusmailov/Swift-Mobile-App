//
//  RegistrationViewController.swift
//  Cashbuster
//
//  Created by Kazbek Borash on 2/28/19.
//  Copyright © 2019 Inculerate. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    // MARK: - Properties
    var numberField:UITextField!
    var descLbl:UILabel!
    var centerView:UIView!
    var iconImage:UIImageView!
    var continueBtn:UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureCenterView()
        configureIcon()
    }
    
    // MARK: - Setupviews
    func configureCenterView() {
        centerView = UIView(frame: CGRect(x: 0, y: view.frame.midY - 100, width: view.frame.width, height: 200))
        centerView.backgroundColor = .white
        
        descLbl = UILabel(frame: CGRect(x: 30, y: 0, width: centerView.frame.width - 60, height: 20))
        descLbl.text = "Sign in with your phone number"
        descLbl.textColor = .black
        descLbl.textAlignment = .center
        descLbl.font = UIFont(name: "Rubik", size: 16)
        descLbl.font = descLbl.font.withSize(16)
        descLbl.font = descLbl.font.withSize(15)
        centerView.addSubview(descLbl)
        
        numberField = UITextField(frame: CGRect(x: 20, y: descLbl.frame.maxY + 20, width: centerView.frame.width - 40, height: 30))
        numberField.setBottomLine(borderColor: .lightGray, height: 1)
        numberField.placeholder = "+7 (777) 777 77 77"
        numberField.addTarget(self, action: #selector(self.numberFieldChanged(textField: )), for: .editingChanged)
        numberField.addTarget(self, action: #selector(self.numberFieldStarted(textField: )), for: .editingDidBegin)
        numberField.keyboardType = .numberPad
        numberField.font = UIFont(name: "Rubik", size: 16)
        numberField.font = numberField.font?.withSize(16)
        centerView.addSubview(numberField)
        
        continueBtn = UIButton(frame: CGRect(x: 20, y: numberField.frame.maxY + 20, width: centerView.frame.width - 40, height: 40))
        continueBtn.setTitle("Next Step", for: .normal)
        continueBtn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        continueBtn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        continueBtn.titleLabel!.font = UIFont(name: "Rubik", size: 16)
        centerView.addSubview(continueBtn)
        
        view.addSubview(centerView)
    }
    
    // MARK: - Methods
    func configureIcon() {
        iconImage = UIImageView(frame: CGRect(x: view.frame.width / 2 - 40, y: centerView.frame.minY / 2 - 40, width: 80, height: 80))
        iconImage.contentMode = .scaleAspectFill
        iconImage.image = UIImage(named: "kazakh")
        view.addSubview(iconImage)
    }
    
    @objc func loginAction() {
        self.present(ConfirmationCodeViewController(), animated: true, completion: nil)
    }
    
    @objc func numberFieldChanged(textField: UITextField) {
        if (textField.text?.count)! <= 4 {
            textField.text = "+7 ("
        } else if textField.text?.count == 7 {
            textField.text = textField.text! + ") "
        } else if textField.text?.count == 12 {
            textField.text = textField.text! + " "
        } else if textField.text?.count == 15 {
            textField.text = textField.text! + " "
        } else if (textField.text?.count)! >= 18 {
            textField.resignFirstResponder()
        }
    }
    
    @objc func numberFieldStarted(textField: UITextField) {
        textField.text = textField.text! + "+7 ("
    }
}
extension UITextField {
    
    func setBottomLine(borderColor: UIColor, height: Double) {
        self.borderStyle = UITextField.BorderStyle.none
        self.backgroundColor = UIColor.clear
        let borderLine = UIView()
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - height, width: Double(self.frame.width), height: height)
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
    
}
