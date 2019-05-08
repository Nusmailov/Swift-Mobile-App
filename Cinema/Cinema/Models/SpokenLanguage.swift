//
//  SpokenLanguage.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/8/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation
import SwiftyJSON

class SpokenLanguage : NSObject, NSCoding{
    
    var iso6391 : String!
    var name : String!
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        iso6391 = dictionary["iso_639_1"] as? String
        name = dictionary["name"] as? String
    }
    init(json: JSON){
        iso6391 = json["iso_639_1"].string
        name = json["name"].string
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        iso6391 = aDecoder.decodeObject(forKey: "iso_639_1") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if iso6391 != nil{
            aCoder.encode(iso6391, forKey: "iso_639_1")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
    }
}
