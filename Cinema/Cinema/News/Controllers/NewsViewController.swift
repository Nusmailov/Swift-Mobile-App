//
//  NewsViewController.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/7/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import SDWebImage
import SVProgressHUD

class NewsViewController: UIViewController {
    // MARK: - Properties
    var movieViewModels = [MovieViewModel]()
    private var filteredMoviesViewModels = [MovieViewModel]()
    let tableView = UITableView(frame: .zero)
    let cellID = "MovieNewsID"
    var refreshControl: UIRefreshControl?
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty:Bool {
        guard let text = searchController.searchBar.text else{ return false }
        return text.isEmpty
    }
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationItem.searchController = searchController
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "News"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfo()
        setupTableView()
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = .red
        refreshControl?.addTarget(self, action: #selector(loadInfo), for: .touchUpInside)
        tableView.addSubview(refreshControl!)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Avengers"
        definesPresentationContext = true
    }
    
    //MARK: - SetupViews
    func setupTableView() {
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
    
    // MARK: - Functions
    @objc func loadInfo() {
        SVProgressHUD.show()
        NewsNetwork.getInfo(success: { (info) in
            SVProgressHUD.dismiss()
            self.movieViewModels = info.map({ return
                    MovieViewModel(movie: $0)
                }
            )
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }) { (error) in
            SVProgressHUD.dismiss()
            print("error")
            self.refreshControl?.endRefreshing()
        }
    }
}

// MARK: - TableView Delegate Methods
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModels.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieViewController()
        if let title = movieViewModels[indexPath.item].title {
            vc.navigationItem.title = "\(String(describing: title))"
        }
        vc.movieViewModel = movieViewModels[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MovieNewsTableViewCell
        tableView.rowHeight = view.frame.width
        cell.selectionStyle = .none
        
        let movie = movieViewModels[indexPath.row]
        cell.movieImageView.sd_setImage(with: movie.getImageUrl())
        cell.nameLabel.text =  movie.title
        if let raiting = movie.voteAverage {
            cell.raitingLabel.text = "\(String(describing: raiting))"
        }
        cell.realizeDate.text = movie.releaseDate
        var rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 500, 100, 0)
        if indexPath.row % 2 == 1 {
            rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
        }
        cell.alpha = 0
        cell.layer.transform = rotationTransform
        cell.movie_id = movie.id
        let defaults = UserDefaults.standard
        let myarray = defaults.array(forKey: "movieidList")  as? [Int] ?? [Int]()
        if myarray.contains(movie.id) {
            cell.starButton.setImage(UIImage(named: "starGold"), for: .normal)
        } else {
            cell.starButton.setImage(UIImage(named: "star"), for: .normal)
        }
        UIView.animate(withDuration: 0.6, animations: {cell.layer.transform = CATransform3DIdentity; cell.alpha = 1})
        return cell
    }
}


extension NewsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    private func searchByText(text: String) {
        
    }
    
}
