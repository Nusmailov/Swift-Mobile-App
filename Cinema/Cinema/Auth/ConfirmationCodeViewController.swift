//
//  ConfirmationCodeViewController.swift
//  Cashbuster
//
//  Created by Kazbek Borash on 3/4/19.
//  Copyright © 2019 Inculerate. All rights reserved.
//

import UIKit

class ConfirmationCodeViewController: UIViewController {
    
    // MARK: - Properties
    var titleLlb:UILabel!
    var closeBtn:UIButton!
    var infoLbl:UILabel!
    var codeInput:UITextField!
    var codeInput1:UITextField!
    var codeInput2:UITextField!
    var codeInput3:UITextField!
    var codeInput4:UITextField!
    var timerLbl:UILabel!
    var continueBtn:UIButton!
    var whatToCheck:String!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTitle()
        configureMainContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        codeInput1.becomeFirstResponder()
    }
    
    // MARK: - Setupviews
    func configureTitle() {
        titleLlb = UILabel(frame: CGRect(x: 20, y: 40, width: 200, height: 40))
        titleLlb.text = "Введите код из СМС"
        titleLlb.textColor = .black
        titleLlb.font = UIFont(name: "Rubik", size: 16)
        titleLlb.font = titleLlb.font.withSize(20)
        //titleLlb.font = UIFont(name: "Rubik", size: 20)
        view.addSubview(titleLlb)
        
        closeBtn = UIButton(frame: CGRect(x: view.frame.width - 45, y: 45, width: 30, height: 30))
        closeBtn.setImage(UIImage(named: "close"), for: .normal)
        closeBtn.titleLabel!.font = UIFont(name: "Rubik", size: 16)
        closeBtn.imageView?.contentMode = .scaleAspectFill
        closeBtn.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        view.addSubview(closeBtn)
    }
    
    func configureMainContent() {
        infoLbl = UILabel(frame: CGRect(x: 20, y: view.frame.midY - 200, width: view.frame.width - 40, height: 60))
        infoLbl.text = "На номер +7 777 888 23 24 отправлен SMS с кодом подтверждения"
        infoLbl.font = UIFont(name: "Rubik", size: 16)
        infoLbl.font = infoLbl.font.withSize(15)
        infoLbl.numberOfLines = 0
        infoLbl.textAlignment = .center
        infoLbl.textColor = .black
        view.addSubview(infoLbl)
        
        codeInput1 = UITextField(frame: CGRect(x: view.frame.midX - 95, y: infoLbl.frame.maxY + 10, width: 40, height: 40))
        codeInput1.setBottomLine(borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), height: 2)
        codeInput1.borderStyle = .none
        codeInput1.keyboardType = .numberPad
        codeInput1.textAlignment = .center
        codeInput1.font = codeInput1.font?.withSize(24)
        codeInput1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        view.addSubview(codeInput1)
        
        codeInput2 = UITextField(frame: CGRect(x: codeInput1.frame.maxX + 10, y: infoLbl.frame.maxY + 10, width: 40, height: 40))
        codeInput2.setBottomLine(borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), height: 2)
        codeInput2.borderStyle = .none
        codeInput2.keyboardType = .numberPad
        codeInput2.textAlignment = .center
        codeInput2.font = codeInput2.font?.withSize(24)
        codeInput2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        view.addSubview(codeInput2)
        
        codeInput3 = UITextField(frame: CGRect(x: codeInput2.frame.maxX + 10, y: infoLbl.frame.maxY + 10, width: 40, height: 40))
        codeInput3.setBottomLine(borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), height: 2)
        codeInput3.borderStyle = .none
        codeInput3.keyboardType = .numberPad
        codeInput3.textAlignment = .center
        codeInput3.font = codeInput3.font?.withSize(24)
        codeInput3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        view.addSubview(codeInput3)
        
        codeInput4 = UITextField(frame: CGRect(x: codeInput3.frame.maxX + 10, y: infoLbl.frame.maxY + 10, width: 40, height: 40))
        codeInput4.setBottomLine(borderColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), height: 2)
        codeInput4.borderStyle = .none
        codeInput4.keyboardType = .numberPad
        codeInput4.textAlignment = .center
        codeInput4.font = codeInput4.font?.withSize(24)
        codeInput4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: .editingChanged)
        view.addSubview(codeInput4)
        
        timerLbl = UILabel(frame: CGRect(x: 20, y: codeInput1.frame.maxY + 10, width: view.frame.width - 40, height: 20))
        timerLbl.textAlignment = .center
        timerLbl.textColor = .gray
        timerLbl.font = timerLbl.font.withSize(14)
        timerLbl.text = "Отправить повторно (32)"
        view.addSubview(timerLbl)
        
        continueBtn = UIButton(frame: CGRect(x: 20, y: timerLbl.frame.maxY + 20, width: view.frame.width - 40, height: 40))
        continueBtn.setTitle("Далее", for: .normal)
        continueBtn.setTitleColor(.white, for: .normal)
        continueBtn.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        continueBtn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(continueBtn)
        
    }
    
    // MARK: - Methods
    @objc func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func registerAction() {
        let app = UIApplication.shared.delegate as! AppDelegate
        view.endEditing(true)
        app.setRootViewTabBar()
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        let text = textField.text
        if text?.count == 1 {
            switch textField {
            case codeInput1 :
                codeInput2.becomeFirstResponder()
            case codeInput2 :
                codeInput3.becomeFirstResponder()
            case codeInput3 :
                codeInput4.becomeFirstResponder()
            case codeInput4 :
                codeInput4.resignFirstResponder()
            default:
                break
            }
        } else {
            
        }
    }
}

