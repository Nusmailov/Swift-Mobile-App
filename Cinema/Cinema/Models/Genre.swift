//
//  Genre.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/8/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation
import SwiftyJSON

class Genre : NSObject, NSCoding {
    var id : Int!
    var name : String!
   
    init(fromDictionary dictionary: [String:Any]) {
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
    }
    
    init(json: JSON) {
        id = json["id"].int
        name = json["name"].string
    }
   
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if id != nil {
            dictionary["id"] = id
        }
        if name != nil {
            dictionary["name"] = name
        }
        return dictionary
    }
    
    @objc required init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    @objc func encode(with aCoder: NSCoder) {
        if id != nil {
            aCoder.encode(id, forKey: "id")
        }
        if name != nil {
            aCoder.encode(name, forKey: "name")
        }
    }
}
