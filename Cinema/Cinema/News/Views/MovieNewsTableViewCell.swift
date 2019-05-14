//
//  MovieNewsTableViewCell.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/9/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class MovieNewsTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupWords()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.addSubview(movieImageView)
        contentView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        movieImageView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(16)
            make.bottom.right.equalToSuperview().offset(-16)
        }
        movieImageView.addSubview(shadowView)
        shadowView.snp.makeConstraints { (make) in
            make.right.left.top.bottom.equalToSuperview()
        }
        
        contentView.addSubview(starBackView)
        starBackView.addSubview(starButton)
        starBackView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(24)
            make.height.width.equalTo(50)
        }
        starButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.width.equalTo(40)
        }
    }
    
    func setupWords(){
        movieImageView.addSubview(raitingView)
        movieImageView.addSubview(nameLabel)
        movieImageView.addSubview(realizeDate)
        nameLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        raitingView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(8)
            make.height.width.equalTo(50)
        }
        raitingView.addSubview(raitingLabel)
        raitingLabel.snp.makeConstraints { (make) in
            make.centerY.centerX.equalToSuperview()
        }
        realizeDate.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.centerX.equalTo(nameLabel)
        }
        
        
    }
    
    // MARK: Actions
    @objc func addToHistory(sender :UIButton){
        
        if starButton.imageView?.image == UIImage(named: "star"){
            starButton.setImage(UIImage(named: "starGold"), for: .normal)
        }else{
            starButton.setImage(UIImage(named: "star"), for: .normal)
        }
    }
    
    // MARK: Views
    let movieImageView: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        return image
    }()
    lazy var starButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "star"), for: .normal)
        button.isEnabled = true
        button.addTarget(self, action: #selector(addToHistory(sender:)), for: .touchUpInside)
        return button
    }()
    
    let starBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    let raitingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    let realizeDate: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Helvetica-Bold", size: 18)//UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        return label
    }()
    
    let raitingLabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 18)//UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        return label
    }()
    let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.alpha = 0.6
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Helvetica-Bold", size: 18)//UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
}

extension UIImageView
{
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}
