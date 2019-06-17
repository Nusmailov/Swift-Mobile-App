//
//  ProductionCompany.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/8/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//
import Foundation
import SwiftyJSON

class ProductionCompany : NSObject, NSCoding{
    
    var id : Int!
    var logoPath : String!
    var name : String!
    var originCountry : String!
    
    init(fromDictionary dictionary: [String:Any]) {
        id = dictionary["id"] as? Int
        logoPath = dictionary["logo_path"] as? String
        name = dictionary["name"] as? String
        originCountry = dictionary["origin_country"] as? String
    }
    
    init(json: JSON) {
        id = json["id"].int
        logoPath = json["logo_path"].string
        name = json["name"].string
        originCountry = json["origin_country"].string
    }
    
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
        }
        if logoPath != nil{
            dictionary["logo_path"] = logoPath
        }
        if name != nil{
            dictionary["name"] = name
        }
        if originCountry != nil{
            dictionary["origin_country"] = originCountry
        }
        return dictionary
    }
    
    @objc required init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        logoPath = aDecoder.decodeObject(forKey: "logo_path") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        originCountry = aDecoder.decodeObject(forKey: "origin_country") as? String
    }
    
    @objc func encode(with aCoder: NSCoder) {
        if id != nil {
            aCoder.encode(id, forKey: "id")
        }
        if logoPath != nil {
            aCoder.encode(logoPath, forKey: "logo_path")
        }
        if name != nil {
            aCoder.encode(name, forKey: "name")
        }
        if originCountry != nil {
            aCoder.encode(originCountry, forKey: "origin_country")
        }
    }
    
}
