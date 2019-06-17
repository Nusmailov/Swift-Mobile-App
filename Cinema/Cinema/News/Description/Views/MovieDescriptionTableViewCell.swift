//
//  MovieDescriptionTableViewCell.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/10/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class MovieDescriptionTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    func setupViews() {
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(10)
            make.bottom.right.equalToSuperview().offset(-10)
        }
    }
}
