//
//  MoviePresenter.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/8/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class MoviePresenter {
    
    public weak var view: MovieView?
    
    func getMovies() {
        view?.showLoading()
        var movies = [Movie]()
        
        let url = URL.init(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=b593d4589446ff5105b0ae36eef4c312")
        let params = [String:Any]()
        
        Alamofire.request(url!,
                          parameters: params,
                          headers: nil)
            .responseJSON { response in
//                print(url!)
                switch response.result {
                case .success(let val):
                    let info = JSON(val)["results"].array
                    for i in info ?? []{
                        movies.append(Movie.init(json: i))
                    }
                    self.view?.showMovies(movies: movies)
//                    print(movies, "get")
                case .failure(let error):
                    print(error)
                }
        }
        view?.hideLoading()
    }
}

protocol MovieView :  BaseView {
    func showMovies(movies:[Movie])
}
