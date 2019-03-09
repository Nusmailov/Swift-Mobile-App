//
//  FlickrService.swift
//  Flickr
//
//  Created by Nurzhigit Smailov on 3/7/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class FlickrService{
//    var urlToPhoto = "http://farm8.staticflickr.com/7875/32359703437_5ec8499022.jpg"
//    var mainUrl = "http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg"
    
    static func getInfoList(success: @escaping ([Photos]) -> Void, failure: @escaping (Error) -> Void) {
        let url = URL.init(string: "https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=9f342dc0b2edfea383debb95782fd39e&format=json&nojsoncallback=1&api_sig=73f8da583d6907820e9c8b7ac30373c2")
        
        Alamofire.request(url!,
                          parameters: nil,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                    case .success(let val):
                        let posts = JSON(val)["photos"].arrayValue
                        var res = [Photos]()
                        for json in posts {
                            res.append(Photos.init(json: json))
                        }
                        
                        success(res)
                    case .failure(let error):
                        failure(error)
                }
        }
        
    }
}
