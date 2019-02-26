//
//  HistoryTableViewCell.swift
//  QA
//
//  Created by Nurzhigit Smailov on 2/26/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var index: UILabel!
    @IBOutlet weak var rightAnswer: UILabel!
    @IBOutlet weak var wrongAnswer: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func initCell(_ index: Int,_ rightAnswer: Int,_ wrongAnswer:Int){
        self.index.text = "\(index)."
        self.rightAnswer.text = "\(rightAnswer)"
        self.wrongAnswer.text = "\(wrongAnswer)"
    }
}
