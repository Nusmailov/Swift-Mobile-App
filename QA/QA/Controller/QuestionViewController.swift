//
//  QuestionViewController.swift
//  QA
//
//  Created by Nurzhigit Smailov on 2/15/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var information: Question?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        loadInformation();
    }
    func loadInformation(){
        let jsonUrl = "https://opentdb.com/api.php?amount=20&category=9&difficulty=medium&type=multiple"
        guard let url = URL(string: jsonUrl) else {return }
        URLSession.shared.dataTask(with: url){(data, response, error) in
        guard let data = data else{return }
            do{
                let jsonHolder = try JSONDecoder().decode(Question.self, from: data)
                self.information = jsonHolder
            }catch let error{
                print("Error\n",error)
            }
        }.resume()
    }
    
}
