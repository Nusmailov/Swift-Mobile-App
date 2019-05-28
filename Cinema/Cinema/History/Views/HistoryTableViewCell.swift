//
//  HistoryTableViewCell.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/14/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.addSubview(movieImage)
        contentView.addSubview(titleLabel)

        movieImage.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(100)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(movieImage.snp.right).offset(8)
            make.right.equalToSuperview().offset(-8)
            make.centerY.equalToSuperview()
        }
    }
    let movieImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 30
        image.layer.masksToBounds = true
        return image
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Helvetica-Bold", size: 20)//UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        return label
    }()
}
