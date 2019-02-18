//
//  Result.swift
//  Model Generated using http://www.jsoncafe.com/
//  Created on February 17, 2019

import Foundation

struct Result : Codable {
    
    let category : String?
    let type : String?
    let difficulty : String?
    let question : String?
    let correctAnswer : String?
    let incorrectAnswers : [String]?
    
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case type = "type"
        case difficulty = "difficulty"
        case question = "question"
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        difficulty = try values.decodeIfPresent(String.self, forKey: .difficulty)
        question = try values.decodeIfPresent(String.self, forKey: .question)
        correctAnswer = try values.decodeIfPresent(String.self, forKey: .correctAnswer)
        incorrectAnswers = try values.decodeIfPresent([String].self, forKey: .incorrectAnswers)
    }
    
}
