//
//  infoCell.swift
//  FlickrCollection
//
//  Created by Nurzhigit Smailov on 3/7/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class InfoService{
    
    static func getInfo(success: @escaping ([Photo]) -> Void, failure: @escaping (Error) -> Void) {
        
//        let url = URL.init(string: "https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=9f342dc0b2edfea383debb95782fd39e&per_page=10&format=json&nojsoncallback=1&api_sig=76461505d9b5d335d27721c923faf6e7")
        
        let url = URL.init(string: "https://api.flickr.com/services/rest/?&")
        var params = [String:Any]()
        
        params["method"] = "flickr.photos.getRecent"
        params["api_key"] = "e95c68bda6354323712d972796eb22b6"
        params["format"] = "json"
        params["nojsoncallback"] = "1"
        params["per_page"] = "100"
        params["api_sig"] = "4141a191fb9e8cebc963937745d3c479"
//        params["page"] = "10"
        
        Alamofire.request(url!,
                          parameters: params,
                          headers: nil)
            .responseJSON { response in
                print(url!)
                switch response.result {
                    case .success(let val):
                        let info = JSON(val)["photos"]["photo"].arrayValue
                        var res = [Photo]()
                        print(info)
                        for i in info{
                            res.append(Photo.init(json: i))
                        }
                        success(res)
                    case .failure(let error):
                        failure(error)
                }
                
                
        }
    }
}
