//
//  CategoryViewController.swift
//  QA
//
//  Created by Nurzhigit Smailov on 2/18/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    var informationEducation: Question?
    var informationSport: Question?
    var informationHistory: Question?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInformation(number: 9)
        loadInformation(number: 21)
        loadInformation(number: 23)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Education"{
            if let cvc = segue.destination as? QuestionViewController{
                loadInformation(number: 9)
                cvc.information = self.informationEducation
            }
        }else if segue.identifier == "Sport"{
            if let cvc = segue.destination as? QuestionViewController{
                loadInformation(number: 21)
                cvc.information = self.informationSport
            }
        }else if segue.identifier == "History"{
            if let cvc = segue.destination as? QuestionViewController{
                loadInformation(number: 23)
                cvc.information = self.informationHistory
            }
        }
    }
    
    
    func loadInformation(number: Int){
        let jsonUrl = "https://opentdb.com/api.php?amount=20&category=\(number)&difficulty=medium&type=multiple"
        guard let url = URL(string: jsonUrl) else {return }
        URLSession.shared.dataTask(with: url){(data, response, error) in
            guard let data = data else{return }
            do{
                let jsonHolder = try JSONDecoder().decode(Question.self, from: data)
                if(number == 9){
                    self.informationEducation = jsonHolder
                }else if(number == 21){
                    self.informationSport = jsonHolder
                }else{
                    self.informationHistory = jsonHolder
                }
            }catch let error{
                print("Error\n",error)
            }
            }.resume()
    }
    
}
