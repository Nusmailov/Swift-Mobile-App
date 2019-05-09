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
    var belongsToCollection : BelongsToCollection
    var budget : Int!
    var genres : [Genre]!
    var homepage : String!
    var id : Int!
    var imdbId : String!
    var originalLanguage : String!
    var originalTitle : String!
    var overview : String!
    var popularity : Float!
    var posterPath : String!
    var productionCompanies : [ProductionCompany]!
    var productionCountries : [ProductionCountry]!
    var releaseDate : String!
    var revenue : Int!
    var runtime : Int!
    var spokenLanguages : [SpokenLanguage]!
    var status : String!
    var tagline : String!
    var title : String!
    var video : Bool!
    var voteAverage : Float!
    var voteCount : Int!
    

    init(json: JSON){
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
        if let genreArray = json["genres"].array{
            for i in genreArray{
                let value = Genre(json: i)
                genres.append(value)
            }
        }
        
        productionCompanies = [ProductionCompany]()
        if let companies = json["production_companies"].array{
            for i in companies{
                let value = ProductionCompany(json: i)
                productionCompanies.append(value)
            }
        }
        productionCountries = [ProductionCountry]()
        if let countries = json["production_countries"].array{
            for i in countries{
                let value = ProductionCompany(json: i)
                productionCompanies.append(value)
            }
        }
        spokenLanguages = [SpokenLanguage]()
        if let languages = json["spoken_languages"].array{
            for i in languages{
                let value = SpokenLanguage(json: i)
                spokenLanguages.append(value)
            }
        }
    }
    func getImageUrl() -> URL {
        let url = "https://image.tmdb.org/t/p/original\(backdropPath)"
        return URL.init(string: url)!
    }
    
//    init(fromDictionary dictionary: [String:Any]){
//        adult = dictionary["adult"] as? Bool
//        backdropPath = dictionary["backdrop_path"] as String
//        budget = dictionary["budget"] as? Int
//        homepage = dictionary["homepage"] as? String
//        id = dictionary["id"] as? Int
//        imdbId = dictionary["imdb_id"] as? String
//        originalLanguage = dictionary["original_language"] as? String
//        originalTitle = dictionary["original_title"] as? String
//        overview = dictionary["overview"] as? String
//        popularity = dictionary["popularity"] as? Float
//        posterPath = dictionary["poster_path"] as? String
//        releaseDate = dictionary["release_date"] as? String
//        revenue = dictionary["revenue"] as? Int
//        runtime = dictionary["runtime"] as? Int
//        status = dictionary["status"] as? String
//        tagline = dictionary["tagline"] as? String
//        title = dictionary["title"] as? String
//        video = dictionary["video"] as? Bool
//        voteAverage = dictionary["vote_average"] as? Float
//        voteCount = dictionary["vote_count"] as? Int
//
//
//        genres = [Genre]()
//        if let genresArray = dictionary["genres"] as? [[String:Any]]{
//            for dic in genresArray{
//                let value = Genre(fromDictionary: dic)
//                genres.append(value)
//            }
//        }
//        productionCompanies = [ProductionCompany]()
//        if let productionCompaniesArray = dictionary["production_companies"] as? [[String:Any]]{
//            for dic in productionCompaniesArray{
//                let value = ProductionCompany(fromDictionary: dic)
//                productionCompanies.append(value)
//            }
//        }
//        productionCountries = [ProductionCountry]()
//        if let productionCountriesArray = dictionary["production_countries"] as? [[String:Any]]{
//            for dic in productionCountriesArray{
//                let value = ProductionCountry(fromDictionary: dic)
//                productionCountries.append(value)
//            }
//        }
//        spokenLanguages = [SpokenLanguage]()
//        if let spokenLanguagesArray = dictionary["spoken_languages"] as? [[String:Any]]{
//            for dic in spokenLanguagesArray{
//                let value = SpokenLanguage(fromDictionary: dic)
//                spokenLanguages.append(value)
//            }
//        }
//    }
//
//    /**
//     * NSCoding required initializer.
//     * Fills the data from the passed decoder
//     */
//    @objc required init(coder aDecoder: NSCoder)
//    {
//        adult = aDecoder.decodeObject(forKey: "adult") as? Bool
//        backdropPath = aDecoder.decodeObject(forKey: "backdrop_path") as? String
//        belongsToCollection = aDecoder.decodeObject(forKey: "belongs_to_collection") as? BelongsToCollection
//        budget = aDecoder.decodeObject(forKey: "budget") as? Int
//        genres = aDecoder.decodeObject(forKey: "genres") as? [Genre]
//        homepage = aDecoder.decodeObject(forKey: "homepage") as? String
//        id = aDecoder.decodeObject(forKey: "id") as? Int
//        imdbId = aDecoder.decodeObject(forKey: "imdb_id") as? String
//        originalLanguage = aDecoder.decodeObject(forKey: "original_language") as? String
//        originalTitle = aDecoder.decodeObject(forKey: "original_title") as? String
//        overview = aDecoder.decodeObject(forKey: "overview") as? String
//        popularity = aDecoder.decodeObject(forKey: "popularity") as? Float
//        posterPath = aDecoder.decodeObject(forKey: "poster_path") as? String
//        productionCompanies = aDecoder.decodeObject(forKey: "production_companies") as? [ProductionCompany]
//        productionCountries = aDecoder.decodeObject(forKey: "production_countries") as? [ProductionCountry]
//        releaseDate = aDecoder.decodeObject(forKey: "release_date") as? String
//        revenue = aDecoder.decodeObject(forKey: "revenue") as? Int
//        runtime = aDecoder.decodeObject(forKey: "runtime") as? Int
//        spokenLanguages = aDecoder.decodeObject(forKey: "spoken_languages") as? [SpokenLanguage]
//        status = aDecoder.decodeObject(forKey: "status") as? String
//        tagline = aDecoder.decodeObject(forKey: "tagline") as? String
//        title = aDecoder.decodeObject(forKey: "title") as? String
//        video = aDecoder.decodeObject(forKey: "video") as? Bool
//        voteAverage = aDecoder.decodeObject(forKey: "vote_average") as? Float
//        voteCount = aDecoder.decodeObject(forKey: "vote_count") as? Int
//    }
//
//
//    @objc func encode(with aCoder: NSCoder)
//    {
//        if adult != nil{
//            aCoder.encode(adult, forKey: "adult")
//        }
//        if backdropPath != nil{
//            aCoder.encode(backdropPath, forKey: "backdrop_path")
//        }
//        if belongsToCollection != nil{
//            aCoder.encode(belongsToCollection, forKey: "belongs_to_collection")
//        }
//        if budget != nil{
//            aCoder.encode(budget, forKey: "budget")
//        }
//        if genres != nil{
//            aCoder.encode(genres, forKey: "genres")
//        }
//        if homepage != nil{
//            aCoder.encode(homepage, forKey: "homepage")
//        }
//        if id != nil{
//            aCoder.encode(id, forKey: "id")
//        }
//        if imdbId != nil{
//            aCoder.encode(imdbId, forKey: "imdb_id")
//        }
//        if originalLanguage != nil{
//            aCoder.encode(originalLanguage, forKey: "original_language")
//        }
//        if originalTitle != nil{
//            aCoder.encode(originalTitle, forKey: "original_title")
//        }
//        if overview != nil{
//            aCoder.encode(overview, forKey: "overview")
//        }
//        if popularity != nil{
//            aCoder.encode(popularity, forKey: "popularity")
//        }
//        if posterPath != nil{
//            aCoder.encode(posterPath, forKey: "poster_path")
//        }
//        if productionCompanies != nil{
//            aCoder.encode(productionCompanies, forKey: "production_companies")
//        }
//        if productionCountries != nil{
//            aCoder.encode(productionCountries, forKey: "production_countries")
//        }
//        if releaseDate != nil{
//            aCoder.encode(releaseDate, forKey: "release_date")
//        }
//        if revenue != nil{
//            aCoder.encode(revenue, forKey: "revenue")
//        }
//        if runtime != nil{
//            aCoder.encode(runtime, forKey: "runtime")
//        }
//        if spokenLanguages != nil{
//            aCoder.encode(spokenLanguages, forKey: "spoken_languages")
//        }
//        if status != nil{
//            aCoder.encode(status, forKey: "status")
//        }
//        if tagline != nil{
//            aCoder.encode(tagline, forKey: "tagline")
//        }
//        if title != nil{
//            aCoder.encode(title, forKey: "title")
//        }
//        if video != nil{
//            aCoder.encode(video, forKey: "video")
//        }
//        if voteAverage != nil{
//            aCoder.encode(voteAverage, forKey: "vote_average")
//        }
//        if voteCount != nil{
//            aCoder.encode(voteCount, forKey: "vote_count")
//        }
//    }
}
