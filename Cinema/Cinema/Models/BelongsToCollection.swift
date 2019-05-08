//
//  BelongsToCollection.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/8/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation
import SwiftyJSON

class BelongsToCollection : NSObject, NSCoding{
    
    var backdropPath : String!
    var id : Int!
    var name : String!
    var posterPath : String!
    
    init(json: JSON){
        backdropPath = json["backdrop_path"].stringValue
        id = json["id"].intValue
        name = json["name"].stringValue
        posterPath = json["poster_path"].stringValue
    }
    
    
    
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        backdropPath = aDecoder.decodeObject(forKey: "backdrop_path") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        posterPath = aDecoder.decodeObject(forKey: "poster_path") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if backdropPath != nil{
            aCoder.encode(backdropPath, forKey: "backdrop_path")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if posterPath != nil{
            aCoder.encode(posterPath, forKey: "poster_path")
        }
    }
}
