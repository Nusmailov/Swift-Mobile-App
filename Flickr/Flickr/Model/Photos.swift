//
//  Photos.swift
//  Flickr
//
//  Created by Nurzhigit Smailov on 3/7/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation
import SwiftyJSON


class Photos{
    var author: String
    var uri: String
    var title: String
    var description: String
    
    init(json: JSON){
        author = json["author"].stringValue
        uri = json["author"].stringValue
        title = json["title"].stringValue
        description = json["description"].stringValue
    }
}
