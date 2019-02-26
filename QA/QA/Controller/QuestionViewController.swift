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
    var cnt = 0;
    var rightAnswer = 0
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var questionNumber: UILabel!
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    var infoDef = [History]()
    var defaults = UserDefaults.standard
    
    @IBAction func touchButtons(_ sender: UIButton) {
        print(cnt)
        if(self.cnt <= 20){
            if sender.titleLabel?.text == information!.results?[cnt-1].correctAnswer{
                rightAnswer += 1
                sender.backgroundColor = UIColor.green
            }else{
                sender.backgroundColor = UIColor.red
            }
            for i in buttons{
                if i.titleLabel?.text == information!.results?[cnt-1].correctAnswer{
                    i.backgroundColor  = UIColor.green
                }
            }
            if(cnt != 20){
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    for i in self.buttons{
                        i.backgroundColor  = UIColor.black
                    }
                    self.reloadQuestion()
                }
            }
            if(cnt == 20){
                DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                    let homeView = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
                    self.present(homeView, animated: true, completion: nil)
                }
            }
        }else{
            finishTap();
        }
        print(rightAnswer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        let finishButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(finishTap))
        self.navigationItem.rightBarButtonItem = finishButton
        reloadQuestion()
    }
    
    @objc func finishTap(){
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        homeView.rightAnswersCount = rightAnswer
        homeView.wrongAnswersCount = 20 - rightAnswer
        // Markdown -- Save Informations
        
        self.infoDef.append(History(rightAnswer, 20 - rightAnswer))
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: infoDef)
        defaults.set(encodedData, forKey: "HistorySaved")
        defaults.synchronize()
        print("Defaults + \n \(defaults)")
        present(homeView, animated: true, completion: nil)
    }
    
    func reloadQuestion(){
        var variants = [String]()
        variants.removeAll()
        if(cnt < 20){
            activityCycle()
            if information?.results != nil {
                activityIndicator.stopAnimating()
                for i in (information!.results?[cnt].incorrectAnswers)!{
                    variants.append(i)
                }
                variants.append((information!.results?[cnt].correctAnswer)!)
                variants.shuffle()
                for i in 0..<buttons.count{
                    buttons[i].setTitle(variants[i], for: .normal)
                }
                questionText.text = information!.results?[cnt].question
                cnt+=1
            }
            
        }
        questionNumber.text = "\(cnt)/20"
    }
    func activityCycle(){
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        activityIndicator.startAnimating()
    }
}
