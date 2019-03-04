//
//  ContactTableViewCell.swift
//  GetContact
//
//  Created by Nurzhigit Smailov on 2/28/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tagImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func generateCell(contact: Contact){
        self.name.text = "\(contact.lastname) \(contact.name)"
        self.phone.text = contact.phone
        self.tagImage.image = UIImage(named: "\(contact.tag)")
    }
}
