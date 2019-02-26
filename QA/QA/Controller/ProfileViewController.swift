//
//  ProfileViewController.swift
//  QA
//
//  Created by Nurzhigit Smailov on 2/26/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var historyButton: UIButton!
    var infoDefaults = [History]()
    override func viewDidLoad() {
        super.viewDidLoad()
        var lineView = UIView(frame: CGRect(x: 0, y: 310, width: 420, height: 1.0))
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(lineView)
        
        // Do any additional setup after loading the view.
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "History"{
            if let cvc = segue.destination as? HistoryViewController{
                let defaults = UserDefaults.standard
                cvc.infoDefaults = defaults.array(forKey: "HistorySaved") as? [History] ?? [History]()
            }
        }
    }
 

}
