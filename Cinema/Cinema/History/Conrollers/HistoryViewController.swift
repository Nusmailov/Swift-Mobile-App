//
//  HistoryViewController.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/7/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import SVProgressHUD
class HistoryViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero)
    let cellId = "cellId"
    var movies = [Movie]()
    var refreshControl: UIRefreshControl?
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        navigationItem.title = "History"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfo()
        setupTableView()
        addRefreshControl()
        tableView.reloadData()
    }
    
    func setupTableView(){
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.right.left.bottom.equalToSuperview()
            make.top.equalToSuperview() //-UIApplication.shared.statusBarFrame.height
        }
        tableView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
    }
    
   func loadInfo() {
        SVProgressHUD.show()
        let defaults = UserDefaults.standard
        let myarray = defaults.array(forKey: "movieidList")  as? [Int] ?? [Int]()
    
        for i in myarray{
            MovieNetworkService.getInfo(withId: i, success: { (movie) in
                self.movies.append(movie)
                self.tableView.reloadData()
            }) { (error) in
                print(error)
            }
        }
    
        SVProgressHUD.dismiss()
    }
     @objc func updateData(){
        loadInfo()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    func addRefreshControl(){
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = .red
        refreshControl?.addTarget(self, action: #selector(updateData), for: .touchUpInside)
        tableView.addSubview(refreshControl!)
    }
}


extension HistoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HistoryTableViewCell
        tableView.rowHeight = 100
        cell.selectionStyle = .none
        cell.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        //anitions
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 100, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 1.0, animations: {cell.layer.transform = CATransform3DIdentity; cell.alpha = 1})
        // datas
        cell.movieImage.sd_setImage(with: movies[indexPath.item].getImageUrl())
        cell.titleLabel.text = movies[indexPath.item].title
        return cell
    }
}