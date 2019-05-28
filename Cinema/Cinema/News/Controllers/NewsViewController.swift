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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
        let sc = UISearchController(searchResultsController: nil)
        navigationItem.searchController = sc
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "News"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        tableView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieViewController()
        if let title = movies[indexPath.item].title{
            vc.navigationItem.title = "\(String(describing: title))"
        }
        vc.movie = movies[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MovieNewsTableViewCell
        cell.backgroundColor = .white
        tableView.rowHeight = view.frame.width
        cell.selectionStyle = .none
        cell.movieImageView.sd_setImage(with: movies[indexPath.row].getImageUrl())
        cell.nameLabel.text =  movies[indexPath.item].title
        if let raiting = movies[indexPath.item].voteAverage{
            cell.raitingLabel.text = "\(String(describing: raiting))"
        }
        cell.realizeDate.text = movies[indexPath.item].releaseDate
        var rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 500, 100, 0)
        if indexPath.row % 2 == 1{
            rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
        }
        cell.alpha = 0
        cell.layer.transform = rotationTransform
        cell.movie_id = movies[indexPath.item].id
        let defaults = UserDefaults.standard
        let myarray = defaults.array(forKey: "movieidList")  as? [Int] ?? [Int]()
        if myarray.contains(movies[indexPath.row].id){
            cell.starButton.setImage(UIImage(named: "starGold"), for: .normal)
        }else{
            cell.starButton.setImage(UIImage(named: "star"), for: .normal)
        }
        UIView.animate(withDuration: 0.6, animations: {cell.layer.transform = CATransform3DIdentity; cell.alpha = 1})
        return cell
    }
}
