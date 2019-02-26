//
//  HistoryViewController.swift
//  QA
//
//  Created by Nurzhigit Smailov on 2/26/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    var infoDefaults = [History]()
    var userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.reloadData()
        print("infoDefaults \(self.infoDefaults)")
        print("userDefaults\(userDefaults)")
    }
    
}
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("infocounter \(infoDefaults.count)")
        return infoDefaults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell") as? HistoryTableViewCell{
            tableView.rowHeight = 100
            cell.initCell(indexPath.row + 1, infoDefaults[indexPath.row].rightAnswer ?? 0, infoDefaults[indexPath.row].wrongAnswer ?? 0)
            return cell
        }
        return HistoryTableViewCell()
    }
}
