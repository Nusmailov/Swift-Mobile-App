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
    
    static func getMovieById(withId id: Int, success: @escaping (Movie) -> Void, failure: @escaping (Error) -> Void) {
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
    
    
    static func getSearchMovies(withText text: String, success: @escaping ([Movie]) -> Void, failure: @escaping (Error) -> Void) {
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
    
    
    static func getNewMovies(success: @escaping ([Movie]) -> Void, failure: @escaping (Error) -> Void) {
        let url = URL.init(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=b593d4589446ff5105b0ae36eef4c312")
        let params = [String:Any]()
        Alamofire.request(url!, parameters: params, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .success(let val):
                    let info = JSON(val)["results"].array
                    var res = [Movie]()
                    for i in info ?? []{
                        res.append(Movie.init(json: i))
                    }
                    success(res)
                case .failure(let error):
                    failure(error)
                }
        }
    }
    
    
    static func getRandomMovie(success: @escaping (Movie) -> Void, failure: @escaping (Error) -> Void) {
        let number = Int.random(in: 0 ... 76341)
        let url = URL.init(string: "https://api.themoviedb.org/3/movie/\(number)?api_key=b593d4589446ff5105b0ae36eef4c312")
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
    
    static func getTopMovies(success: @escaping ([Movie]) -> Void, failure: @escaping (Error) -> Void) {
        let url = URL.init(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=b593d4589446ff5105b0ae36eef4c312")
        let params = [String:Any]()
        Alamofire.request(url!, parameters: params, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success(let val):
                let info = JSON(val)["results"].array
                var res = [Movie]()
                for i in info ?? []{
                    res.append(Movie.init(json: i))
                }
                success(res)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
