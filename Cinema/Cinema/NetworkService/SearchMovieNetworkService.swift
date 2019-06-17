//
//  SearchMovieNetworkService.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 6/17/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SearchMovieNetworkService{
    
    static func getInfo(withText text: String, success: @escaping ([Movie]) -> Void, failure: @escaping (Error) -> Void) {
        var newText: String
        if text.contains(" ") {
            newText = text.replacingOccurrences(of: " ", with: "%20")
        } else {
            newText = text
        }
        let url = URL.init(string: "https://api.themoviedb.org/3/search/movie?api_key=b593d4589446ff5105b0ae36eef4c312&language=en-US&query=\(newText)&page=1&include_adult=false")
        let params = [String:Any]()
        Alamofire.request(url!, parameters: params, headers: nil)
            .responseJSON { response in
                switch response.result {
                    case .success(let val):
                        let info = JSON(val)["results"].array
                        var res = [Movie]()
                        for i in info ?? []{
                            let movieInfo = Movie.init(json: i)
                            if movieInfo.backdropPath != ""{
                                res.append(movieInfo)
                            }
                        }
                        success(res)
                    case .failure(let error):
                        failure(error)
                }
        }
    }
    
}
