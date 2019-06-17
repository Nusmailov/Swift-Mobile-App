//
//  MovieViewModel.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 6/17/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation

struct MovieViewModel {
    
    // MARK: - Properties
    let adult : Bool
    var backdropPath : String
    var budget : Int!
    var homepage : String!
    var id : Int!
    var imdbId : String!
    var originalLanguage : String!
    var originalTitle : String!
    var overview : String!
    var popularity : Float!
    var posterPath : String!
    var releaseDate : String!
    var revenue : Int!
    var runtime : Int!
    var status : String!
    var tagline : String!
    var title : String!
    var video : Bool!
    var voteAverage : Float!
    var voteCount : Int!
    var belongsToCollection : BelongsToCollection
    var productionCompanies : [ProductionCompany]!
    var productionCountries : [ProductionCountry]!
    var spokenLanguages : [SpokenLanguage]!
    var genres : [Genre]!
    
    init(movie: Movie) {
        self.id = movie.id
        self.adult = movie.adult
        self.backdropPath = movie.backdropPath
        self.budget = movie.budget
        self.homepage = movie.homepage
        self.imdbId = movie.imdbId
        self.originalLanguage = movie.originalLanguage
        self.originalTitle = movie.originalTitle
        self.overview = movie.overview
        self.popularity = movie.popularity
        self.posterPath = movie.posterPath
        self.releaseDate = movie.releaseDate
        self.revenue = movie.revenue
        self.runtime = movie.runtime
        self.status = movie.status
        self.tagline = movie.tagline
        self.title = movie.title
        self.video = movie.video
        self.voteAverage = movie.voteAverage
        self.voteCount = movie.voteCount
        self.belongsToCollection = movie.belongsToCollection
        self.productionCompanies = movie.productionCompanies
        self.productionCountries = movie.productionCountries
        self.spokenLanguages = movie.spokenLanguages
        self.genres = movie.genres
    }
    
    
    // MARK: - Methods
    func getImageUrl() -> URL {
        let url = "https://image.tmdb.org/t/p/original\(backdropPath)"
        return URL.init(string: url)!
    }
}
