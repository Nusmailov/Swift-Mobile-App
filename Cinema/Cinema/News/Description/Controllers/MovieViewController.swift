//
//  MovieViewController.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/10/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero)
    let cellPhoto = "cellPhoto"
    let cellId = "cellId"
    let cell = "cell"
    var movie: Movie?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
//        
    }
    
    func setupTableView(){
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.register(MovieDescriptionTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(MoviePhotoTableViewCell.self, forCellReuseIdentifier: cellPhoto)
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
    
}
extension MovieViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item  == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellPhoto, for: indexPath) as! MoviePhotoTableViewCell
            tableView.rowHeight = 300
            cell.selectionStyle = .none
            cell.movieImage.sd_setImage(with: movie?.getImageUrl())
            if let raiting = movie?.voteAverage{
                cell.raitingLabel.text = "\(String(describing: raiting))"
            }
            cell.nameLabel.text = movie?.title
            cell.realizeDate.text = movie?.releaseDate
            return cell
        }else if indexPath.item == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieDescriptionTableViewCell
            tableView.rowHeight =  200
            cell.descriptionLabel.text = movie?.overview
            cell.selectionStyle = .none
            return cell
        }
        let cell = UITableViewCell()
        cell.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return UITableView.automaticDimension
//    }
    
}
