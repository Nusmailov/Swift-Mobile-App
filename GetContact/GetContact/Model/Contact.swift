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
    case gray
    case none
}

class Contact{
    var name: String
    var lastname: String
    var phone: String
    var tag: TagColor?
    
    init(name: String, lastname: String, phone: String, tag: TagColor){
        self.name = name
        self.lastname = lastname
        self.phone = phone
        self.tag = tag
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let lastname = aDecoder.decodeObject(forKey: "lastname") as! String
        let phone = aDecoder.decodeObject(forKey: "phone") as! String
        let tag = aDecoder.decodeObject(forKey: "tag") as! TagColor
        self.init(name: name, lastname: lastname, phone: phone, tag: tag)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(lastname, forKey: "lastname")
        aCoder.encode(phone, forKey: "phone")
        aCoder.encode(tag, forKey: "tag")
    }
    
}
