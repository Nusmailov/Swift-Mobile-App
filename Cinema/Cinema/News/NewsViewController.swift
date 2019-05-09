//
//  NewsViewController.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/7/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import Gemini
import SVProgressHUD


class NewsViewController: UIViewController {
    var movies = [Movie]()
    let tableView = UITableView(frame: .zero)
    let cellID = "MovieNewsID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "News"
        loadInfo()
        setupTableView()
    }
    
    func loadInfo() {
        SVProgressHUD.show()
        NewsNetwork.getInfo(success: { (info) in
            SVProgressHUD.dismiss()
            self.movies = info
            self.tableView.reloadData()
        }) { (error) in
            SVProgressHUD.dismiss()
            print("error")
        }
    }
    
    func setupTableView(){
        tableView.register(MovieNewsTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .none
        view.addSubview(tableView)
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MovieNewsTableViewCell
        cell.backgroundColor = .white
        tableView.rowHeight = view.frame.width
        cell.selectionStyle = .none
        cell.movieImageView.sd_setImage(with: movies[indexPath.row].getImageUrl())
        cell.nameLabel.text =  movies[indexPath.item].title
        if let  raiting = movies[indexPath.item].voteAverage{
            cell.raitingLabel.text = "\(String(describing: raiting))"
        }
        cell.realizeDate.text = movies[indexPath.item].releaseDate
        var rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 500, 100, 0)
        if indexPath.row % 2 == 1{
            rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
        }
        cell.alpha = 0
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 1.0, animations: {cell.layer.transform = CATransform3DIdentity; cell.alpha = 1})
        return cell
    }
    
}
