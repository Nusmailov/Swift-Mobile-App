//
//  Movie.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/8/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie {
    
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
    
    init(json: JSON) {
        adult = json["adult"].boolValue
        backdropPath = json["backdrop_path"].stringValue
        budget = json["budget"].intValue
        homepage = json["homepage"].stringValue
        id = json["id"].intValue
        imdbId = json["imdbId"].stringValue
        originalLanguage = json["originalLanguage"].stringValue
        originalTitle = json["originalTitle"].stringValue
        overview = json["overview"].stringValue
        popularity = json["popularity"].floatValue
        posterPath = json["posterPath"].stringValue
        releaseDate = json["releaseDate"].stringValue
        revenue = json["revenue"].intValue
        runtime = json["runtime"].intValue
        voteAverage = json["vote_average"].floatValue
        voteCount = json["voteCount"].intValue
        belongsToCollection = BelongsToCollection.init(json: json["belongs_to_collection"])
        genres = [Genre]()
        title = json["title"].string
        releaseDate = json["release_date"].string
        overview = json["overview"].string
        
        if let genreArray = json["genres"].array {
            for i in genreArray{
                let value = Genre(json: i)
                genres.append(value)
            }
        }
        
        productionCompanies = [ProductionCompany]()
        if let companies = json["production_companies"].array {
            for i in companies{
                let value = ProductionCompany(json: i)
                productionCompanies.append(value)
            }
        }
        productionCountries = [ProductionCountry]()
        if let countries = json["production_countries"].array {
            for i in countries{
                let value = ProductionCompany(json: i)
                productionCompanies.append(value)
            }
        }
        spokenLanguages = [SpokenLanguage]()
        if let languages = json["spoken_languages"].array {
            for i in languages {
                let value = SpokenLanguage(json: i)
                spokenLanguages.append(value)
            }
        }
    }
    
    func getImageUrl() -> URL {
        let url = "https://image.tmdb.org/t/p/original\(backdropPath)"
        return URL.init(string: url)!
    }
    
}
