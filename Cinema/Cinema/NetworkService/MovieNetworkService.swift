//
//  MovieNetworkService.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/10/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MovieNetworkService {
    
    static func getInfo(withId id: Int, success: @escaping (Movie) -> Void, failure: @escaping (Error) -> Void) {
        let url = URL.init(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=b593d4589446ff5105b0ae36eef4c312")
        let params = [String:Any]()
        Alamofire.request(url!,
                          parameters: params,
                          headers: nil)
            .responseJSON { response in
                switch response.result {
                    case .success(let val):
                        let info = JSON(val)
                        let res = Movie.init(json: info)
                        success(res)
                    case .failure(let error):
                        failure(error)
                }
        }
    }
}
