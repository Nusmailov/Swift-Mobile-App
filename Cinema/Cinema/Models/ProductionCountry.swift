//
//  ProductionCountry.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/8/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation
import SwiftyJSON

class ProductionCountry : NSObject, NSCoding{
    
    var iso31661 : String!
    var name : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        iso31661 = dictionary["iso_3166_1"] as? String
        name = dictionary["name"] as? String
    }
    init(json: JSON){
        iso31661 = json["iso_3166_1"].string
        name = json["name"].string
    }
   
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        iso31661 = aDecoder.decodeObject(forKey: "iso_3166_1") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if iso31661 != nil{
            aCoder.encode(iso31661, forKey: "iso_3166_1")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
    }
}
