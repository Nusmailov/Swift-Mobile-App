//
//  FilmListViewController.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/8/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import SVProgressHUD

class FilmListViewController: UIViewController {
    var collectionView:  UICollectionView!
    var cellId = "cellID"
    var movieList = [Movie]()
    var movieViewModel: MovieViewModel?
    
    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.navigationController!.navigationBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        navigationItem.title = "Top Rated Films"
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        movieViewModel = MovieViewModel()
        loadInfo()
    }
    
    //MARK: - SetupViews
    func setupCollectionView() {
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width-60.0, height: view.frame.size.height-50)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.5
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 3.0)
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: flowLayout)
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
    }
    
    //MARK: - Methods
    func loadInfo() {
        SVProgressHUD.show()
        movieViewModel?.getTopMovies(success: { (movies) in
            self.movieList = movies
            self.collectionView.reloadData()
            SVProgressHUD.dismiss()
        })
    }
}

//MARK: - Collection View Delegate
extension  FilmListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MovieCollectionViewCell
        cell.movieImage.sd_setImage(with: movieList[indexPath.row].getImageUrl())
        cell.titleLabel.text = movieList[indexPath.row].title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - self.view.frame.width/4, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieViewController()
        if let title = movieList[indexPath.item].title{
            vc.navigationItem.title = "\(String(describing: title))"
        }
        vc.movie = movieList[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
