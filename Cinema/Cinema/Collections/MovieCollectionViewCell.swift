//
//  MovieCollectionViewCell.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/15/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = .red
        contentView.addSubview(movieImage)
        backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        movieImage.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        }
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(movieImage.snp.bottom).offset(-150)
            make.left.equalTo(8)
            make.right.equalTo(-8)
        }
    }
    
    let movieImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 20
        image.layer.masksToBounds = true
        return image
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return  label
    }()
}
