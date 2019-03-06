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
    var page:Int
    var pages: Int
    var perpage: Int
    var total: Int
    var photo: [Photo]
    
    init(json: JSON){
        page = json["page"].intValue
        pages = json["pages"].intValue
        perpage = json["perpage"].intValue
        total = json["total"].intValue
        photo = [Photo.init(json: json["photo"])]
    }
}

class Photo{
    
    var id: String
    var owner: String
    var server: String
    var farm: Int
    var title: String
    
    var ispublic: Int
    var isfriend: Int
    var isfamily: Int
    
    init(json: JSON) {
        id = json["id"].stringValue
        owner = json["owner"].stringValue
        server = json["server"].stringValue
        title = json["title"].stringValue
        farm = json["farm"].intValue
        ispublic = json["ispublic"].intValue
        isfriend = json["isfriend"].intValue
        isfamily = json["isfamily"].intValue
    }
}
