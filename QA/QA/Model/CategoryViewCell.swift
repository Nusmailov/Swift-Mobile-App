//
//  CategoryViewCell.swift
//  QA
//
//  Created by Nurzhigit Smailov on 2/15/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class CategoryViewCell: UITableViewCell {

    @IBOutlet weak var categoryText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(categoryText:  String){
        self.categoryText.text = categoryText
    }
}
