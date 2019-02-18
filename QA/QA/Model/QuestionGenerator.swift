//
//  QuestionGenerator.swift
//  QA
//
//  Created by Nurzhigit Smailov on 2/17/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import Foundation


class QuestionGenerator{
    
    public static func getQuestions() -> [Question]{
//        var informations = [Question]()
        var questions = [Question]()
        let jsonUrl = "https://opentdb.com/api.php?amount=20&category=9&difficulty=medium&type=multiple"
        let url = URL(string: jsonUrl)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                let jsonPlaceHolders = try JSONDecoder().decode([Question].self, from: data!)
                print(jsonPlaceHolders)
            }catch let error{
                print("Error\n",error)
            }
            }.resume()
        return questions
    }
    
}
