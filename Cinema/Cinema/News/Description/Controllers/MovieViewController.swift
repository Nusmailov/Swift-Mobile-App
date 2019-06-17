//
//  MovieViewController.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/10/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    // MARK: - Properties
    let tableView = UITableView(frame: .zero)
    let cellPhoto = "cellPhoto"
    let cellId = "cellId"
    let cell = "cell"
    var movieViewModel: MovieViewModel?
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.navigationController!.navigationBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Functions
    func setupTableView() {
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.register(MovieDescriptionTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(MoviePhotoTableViewCell.self, forCellReuseIdentifier: cellPhoto)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.right.left.bottom.equalToSuperview()
            make.top.equalToSuperview() //-UIApplication.shared.statusBarFrame.height
        }
        tableView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
    }
    
}

// MARK: - TableViewDelegate Methods
extension MovieViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item  == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellPhoto, for: indexPath) as! MoviePhotoTableViewCell
            cell.selectionStyle = .none
            cell.movieImage.sd_setImage(with: movieViewModel?.getImageUrl())
            if let raiting = movieViewModel?.voteAverage{
                cell.raitingLabel.text = "\(String(describing: raiting))"
            }
            cell.nameLabel.text = movieViewModel?.title
            cell.realizeDate.text = movieViewModel?.releaseDate
            cell.movie_id = movieViewModel?.id ?? -1
            let defaults = UserDefaults.standard
            let myarray = defaults.array(forKey: "movieidList")  as? [Int] ?? [Int]()
            if myarray.contains(cell.movie_id){
               cell.starButton.setImage(UIImage(named: "starGold"), for: .normal)
            }else{
                cell.starButton.setImage(UIImage(named: "star"), for: .normal)
            }
            return cell
        } else if indexPath.item == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieDescriptionTableViewCell
            cell.descriptionLabel.text = movieViewModel?.overview
            cell.selectionStyle = .none
            return cell
        }
        let cell = UITableViewCell()
        cell.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        } else if indexPath.row == 1 {
            return UITableView.automaticDimension
        }
        return 0
    }
    
}
