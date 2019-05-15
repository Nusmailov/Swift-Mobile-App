//
//  ProfileVC.swift
//  CashbusterV2
//
//  Created by Kazbek Borash on 3/27/19.
//  Copyright © 2019 inculerate. All rights reserved.
//

import UIKit
import SnapKit


class ProfileViewController: UIViewController {
    var profileView:UIView!
    var editButton: UIButton!
    var isOkTransaction = false
    var fromTransaction = false
    var successView:UIView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.navigationController!.navigationBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        navigationItem.title = "Profile"
        setupProfileViews()
        setupSettingButtons()
    }
    
    
    fileprivate func setupProfileViews(){
        view.addSubview(profileBackView)
        profileBackView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.left.equalToSuperview()
            make.height.equalTo(100)
        }
        let liner = line()
        profileBackView.addSubview(profileImageView)
        profileBackView.addSubview(phoneLabel)
        profileBackView.addSubview(liner)
        
        
        profileImageView.snp.makeConstraints { (make) in
            make.left.equalTo(profileBackView).offset(24)
            make.top.equalTo(profileBackView).offset(24)
            make.height.width.equalTo(60)
        }
        phoneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileBackView).offset(24)
            make.left.equalTo(profileImageView.snp.right).offset(24)
            make.right.equalToSuperview()
        }
    }
    
    
    fileprivate func setupSettingButtons(){
        let colorGray = UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 0.2)
        let settingsButton = button(text: "Settings", color: colorGray)
        
        let shareAppButton = button(text: "Share app", color: colorGray)
        //Настройки
        view.addSubview(settingsButton)
        settingsButton.snp.makeConstraints { (make) in
            make.top.equalTo(profileBackView.snp.bottom).offset(24)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.width/7)
        }
        
        
        
        //Поделиться приложением
        view.addSubview(shareAppButton)
        shareAppButton.snp.makeConstraints { (make) in
            make.top.equalTo(settingsButton.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.width/7)
        }
        
        let faqButtoon = button(text: "FAQ", color: colorGray)
        let contactButton = button(text: "Contact with us",color: colorGray)
        let aboutAppButton = button(text: "About App", color:  colorGray)
        let exitButton = button(text: "Exit", color: colorGray)
        //Часто задаваемые вопросы
        view.addSubview(faqButtoon)
        view.addSubview(contactButton)
        view.addSubview(aboutAppButton)
        view.addSubview(exitButton)
        faqButtoon.snp.makeConstraints { (make) in
            make.top.equalTo(shareAppButton.snp.bottom).offset(24)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.width/7)
        }
        contactButton.snp.makeConstraints { (make) in
            make.top.equalTo(faqButtoon.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.width/7)
        }
        aboutAppButton.snp.makeConstraints { (make) in
            make.top.equalTo(contactButton.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.width/7)
        }
        aboutAppButton.addTarget(self, action: #selector(openAboutApp), for: .touchUpInside)
        exitButton.snp.makeConstraints { (make) in
            make.top.equalTo(aboutAppButton.snp.bottom).offset(24)
            make.left.right.equalToSuperview()
            make.height.equalTo(view.frame.width/7)
        }
        exitButton.addTarget(self, action: #selector(quitAction), for: .touchUpInside)
    }
    
    
    @objc func quitAction() {
        let app = UIApplication.shared.delegate as! AppDelegate
        app.setRootViewAuth()
    }
    @objc func openAboutApp(){
        let vc = AboutAppViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profile")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 25
        image.contentMode = .scaleAspectFit
        image.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        return image
    }()
    let profileBackView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return view
    }()
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Smailov Nurzhigit"
        label.font = UIFont(name: "RobotoMono-Medium", size: 20)
        label.textColor = .white
        label.font = label.font.withSize(20)
        return label
    }()
    
    func line() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 0.2)
        return view
    }
    
    func button(text: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        
        let textIn = UILabel()
        textIn.text = text
        textIn.textColor = .white
        textIn.font = UIFont(name: "Rubik-Regular", size: 14)
        textIn.font = textIn.font.withSize(14)
        
        button.addSubview(textIn)
        textIn.snp.makeConstraints { (make) in
            make.centerY.equalTo(button)
            make.left.equalTo(16)
        }
        
        let line = UIView()
        line.backgroundColor = color
        button.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.bottom.equalTo(button.snp.bottom)
            make.left.equalTo(24)
            make.right.equalToSuperview()
            make.height.equalTo(2)
        }
        
        let nextImage = UIImageView()
        nextImage.image = UIImage(named: "next")
        button.addSubview(nextImage)
        nextImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(button)
            make.right.equalTo(button).offset(-20)
            make.height.equalTo(16)
            make.width.equalTo(13)
        }
        
        return button
    }
}
