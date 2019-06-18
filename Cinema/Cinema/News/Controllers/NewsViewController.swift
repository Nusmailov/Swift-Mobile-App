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
import RxCocoa
import RxSwift

class NewsViewController: UIViewController {
    // MARK: - Properties
    var movieList = [Movie]()
    var filteredListMovie = [Movie]()
    var movieViewModel: MovieViewModel?
    let tableView = UITableView(frame: .zero)
    let cellID = "MovieNewsID"
    var refreshControl: UIRefreshControl?
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var searchBarIsEmpty:Bool {
        guard let text = searchController.searchBar.text else{ return false }
        return text.isEmpty
    }
    
    private var isFiltering:Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        navigationItem.searchController = searchController
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationItem.title = "News"
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieViewModel = MovieViewModel()
        loadInfo()
        setupTableView()
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = .red
        refreshControl?.addTarget(self, action: #selector(loadInfo), for: .touchUpInside)
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
        tableView.keyboardDismissMode = .onDrag
    }
    
    // MARK: - Functions
    @objc func loadInfo() {
        SVProgressHUD.show()
        movieViewModel?.getNewMovies(success: { (movies) in
            self.movieList = movies
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
            SVProgressHUD.dismiss()
        })
    }
}

// MARK: - TableView Delegate Methods
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering { return filteredListMovie.count }
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieViewController()
        var movie: Movie
        if isFiltering { movie = filteredListMovie[indexPath.row] }
        else { movie = movieList[indexPath.row] }
        if let title = movie.title {
            vc.navigationItem.title = "\(String(describing: title))"
        }
        vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MovieNewsTableViewCell
        tableView.rowHeight = view.frame.width
        cell.selectionStyle = .none
        var movie: Movie
        if isFiltering { movie = filteredListMovie[indexPath.row] }
        else { movie = movieList[indexPath.row] }
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
        searchController.searchBar.rx.text.throttle(1.0, scheduler: MainScheduler.instance)
        .distinctUntilChanged()
            .subscribe { [weak self] (query) in
                self?.searchByText(text: searchController.searchBar.text!)
        }
    }
    
    private func searchByText(text: String) {
        movieViewModel?.getSearchMovies(text: text, success: { (filteredMovies) in
            self.filteredListMovie = filteredMovies
            self.tableView.reloadData()
        })
    }
    
}
