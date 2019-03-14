//
//  ColorCollectionViewCell.swift
//  GetContact
//
//  Created by Nurzhigit Smailov on 3/11/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        image.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 40, enableInsets: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var image: UIImageView = {
        let img =  UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return  img
    }()
}
