//
//  Contact.swift
//  GetContact
//
//  Created by Nurzhigit Smailov on 2/28/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation

enum TagColor {
    case red
    case green
    case blue
    case yellow
    case orange
}

class Contact{
    var name: String
    var lastname: String
    var phone: String
    var tag: TagColor
    
    init(name: String, lastname: String, phone: String, tag: TagColor){
        self.name = name
        self.lastname = lastname
        self.phone = phone
        self.tag = tag
    }
}
