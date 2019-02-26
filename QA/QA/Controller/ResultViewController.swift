//
//  ResultViewController.swift
//  QA
//
//  Created by Nurzhigit Smailov on 2/20/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var rightAnwer: UILabel!
    @IBOutlet weak var wrongAnswer: UILabel!
    
    var rightAnswersCount = 0
    var wrongAnswersCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  UIColor(patternImage: UIImage(named:"done")!)
        
        rightAnwer.text = "\(rightAnswersCount)"
        wrongAnswer.text = "\(wrongAnswersCount)"
    }
}
