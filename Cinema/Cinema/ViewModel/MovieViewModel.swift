//
//  MovieViewModel.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 6/17/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation

class MovieViewModel {
    
    // MARK: - Methods
    func getImageUrl(backdropPath: String) -> URL {
        let url = "https://image.tmdb.org/t/p/original\(backdropPath)"
        return URL.init(string: url)!
    }
    
    func getRandomMovie(success: @escaping (Movie) -> () ){
        MovieNetworkService.getRandomMovie(success: { (movie) in
            success(movie)
        }) { (error) in
            print(error)
        }
    }
    
    func getTopMovies(success: @escaping ([Movie]) -> () ){
        MovieNetworkService.getTopMovies(success: { (info) in
                success(info)
            }) { (error) in
            print("error")
        }
    }
    
    func getFilmById(idFilm: Int, success: @escaping (Movie) -> ()){
        MovieNetworkService.getMovieById(withId: idFilm, success: { (movie) in
            success(movie)
        }) { (error) in
            print("error")
        }
    }
}

//class MovieListViewModel {
//    filetered
//    movie
//
//
//    getNumberMovies
//
//    movie(at index: Int) -> Movie
//}
