//
//  QuestionViewController.swift
//  QA
//
//  Created by Nurzhigit Smailov on 2/15/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var information: Question!
    var cnt = 0;
    var rightAnswer = 0
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var questionNumber: UILabel!
    
    @IBAction func touch1(_ sender: UIButton) {
        if sender.titleLabel?.text == information!.results?[cnt].correctAnswer{
            rightAnswer += 1
        }
        reloadQuestion()
    }
    
    @IBAction func touch2(_ sender: UIButton) {
        if sender.titleLabel?.text == information!.results?[cnt].correctAnswer{
            rightAnswer += 1
        }
        reloadQuestion()
    }
    
    @IBAction func touch3(_ sender: UIButton) {
        if sender.titleLabel?.text == information!.results?[cnt].correctAnswer{
            rightAnswer += 1
        }
        reloadQuestion()
    }
    
    @IBAction func touch4(_ sender: UIButton) {
        if sender.titleLabel?.text == information!.results?[cnt].correctAnswer{
            rightAnswer += 1
        }
        reloadQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        //print(self.information)
        reloadQuestion()
    }
    
    
    func reloadQuestion(){
        var variants = [String]()
        variants.removeAll()
        for i in (information!.results?[cnt].incorrectAnswers)!{
            variants.append(i)
        }
        variants.append((information!.results?[cnt].correctAnswer)!)
        variants.shuffle()
        for i in 0..<buttons.count{
            buttons[i].setTitle(variants[i], for: .normal)
        }
        questionText.text = information!.results?[cnt].question
        if(cnt  <= 20){
            cnt+=1
        }
        questionNumber.text = "\(cnt)/20"
    }
    
}
