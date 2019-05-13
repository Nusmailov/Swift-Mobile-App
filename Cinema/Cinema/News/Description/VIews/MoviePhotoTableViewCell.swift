//
//  MoviePhotoTableViewCell.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/10/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class MoviePhotoTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.addSubview(movieImage)
        movieImage.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        movieImage.addSubview(raitingView)
        movieImage.addSubview(realizeDate)
        movieImage.addSubview(nameLabel)
        
        raitingView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(16)
            make.width.height.equalTo(50)
        }
        raitingView.addSubview(raitingLabel)
        raitingLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        realizeDate.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(realizeDate)
            make.bottom.equalTo(realizeDate.snp.top).offset(-8)
        }
    }
    
    let movieImage: UIImageView = {
        let image = UIImageView()
        return image
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
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 18)//UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        label.backgroundColor = .white
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }()
    
    let raitingLabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 18)//UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        return label
    }()
    let nameLabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 18)//UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        label.backgroundColor = .white
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }()
}
