//
//  Question.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on February 17, 2019

import Foundation

struct Question : Codable {
    
    let responseCode : Int?
    let results : [Result]?
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        responseCode = try values.decodeIfPresent(Int.self, forKey: .responseCode)
        results = try values.decodeIfPresent([Result].self, forKey: .results)
    }
    
}
