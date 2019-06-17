//
//  RandomFilmViewController.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/28/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import SVProgressHUD

class RandomFilmViewController: UIViewController {
    // MARK: - Properties
    var randomMovieViewModel: MovieViewModel?
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = label.font.withSize(20)
        label.numberOfLines = 0
        return  label
    }()
    
    let filmImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        image.backgroundColor = .black
        //        image.image = UIImage(named: "movie_logo")
        return image
    }()
    
    let realizeDate: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Helvetica-Bold", size: 18)//UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        return label
    }()
    
    let raitingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    let voteAvgLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.font = label.font.withSize(20)
        label.numberOfLines = 0
        return label
    }()
    
    let overViewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = label.font.withSize(15)
        label.numberOfLines = 0
        return label
    }()
    
    var darkMode = false
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return darkMode ? .default : .lightContent
    }
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.navigationController?.navigationBar.barStyle = .blackTranslucent
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Random Film"
        setupScrollView()
        setupViews()
        getRandomFilm()
        let getRandomButton = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(getRandomFilm))
        self.navigationItem.rightBarButtonItem = getRandomButton
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - SetupViews
    func setupScrollView() {
        view.backgroundColor = .white
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        scrollView.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        scrollView.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        scrollView.addSubview(contentView)
        contentView.snp_makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(view)
        }
    }

    func setupViews() {
        contentView.addSubview(filmImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(realizeDate)
        contentView.addSubview(voteAvgLabel)
        contentView.addSubview(overViewLabel)
        
        filmImage.snp.makeConstraints { (make) in
            make.top.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(self.view.frame.height/3)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(filmImage.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        
        realizeDate.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        
        filmImage.addSubview(raitingView)
        raitingView.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview().offset(-8)
            make.width.height.equalTo(50)
        }
        
        raitingView.addSubview(voteAvgLabel)
        
        voteAvgLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        overViewLabel.snp.makeConstraints { (make) in
            make.top.equalTo(realizeDate.snp_bottom).offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    @objc func getRandomFilm() {
        SVProgressHUD.show()
        RandomNetworkService.getInfo(success: { (movie) in
            self.randomMovieViewModel = MovieViewModel(movie: movie)
            if self.randomMovieViewModel?.backdropPath == "" || self.randomMovieViewModel?.overview == "" {
                self.getRandomFilm()
                return
            }
            self.filmImage.sd_addActivityIndicator()
            self.filmImage.sd_showActivityIndicatorView()
            self.filmImage.sd_setImage(with: self.randomMovieViewModel?.getImageUrl())
            self.filmImage.sd_removeActivityIndicator()
            self.realizeDate.text = self.randomMovieViewModel?.releaseDate
            self.titleLabel.text = self.randomMovieViewModel?.title
            if let voteAvg =  self.randomMovieViewModel?.voteAverage {
                self.voteAvgLabel.text = "\(String(describing: voteAvg))"
            }
            self.overViewLabel.text = self.randomMovieViewModel?.overview
            self.filmImage.isHidden = false
            SVProgressHUD.dismiss()
        }) { (error) in
            print(error)
        }
    }
}
