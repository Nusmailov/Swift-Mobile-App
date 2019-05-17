//
//  RandomViewController.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/8/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import SDWebImage
import SVProgressHUD

class RandomViewController: UIViewController {
    var randomMovie: Movie?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Random Film"
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        view.addSubview(getRandomButton)
        
        getRandomButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(80)
        }
        
        setFilmViews()
        filmImage.isHidden = true
    }
    func setFilmViews(){
        view.addSubview(filmImage)
        view.addSubview(titleLabel)
        view.addSubview(realizeDate)
        view.addSubview(voteAvgLabel)
        view.addSubview(overViewLabel)
        
        filmImage.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.left.equalTo(10)
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
            make.width.height.equalTo(70)
        }
        raitingView.addSubview(voteAvgLabel)
        voteAvgLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        overViewLabel.snp.makeConstraints { (make) in
            make.top.equalTo(realizeDate.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)

        }
        
    }
    
    //MARK: - Actions
    @objc func getRandomFilm(){
        SVProgressHUD.show()
        RandomNetworkService.getInfo(success: { (movie) in
            self.randomMovie = movie
            if self.randomMovie?.backdropPath == "" || self.randomMovie?.overview == ""{
                self.getRandomFilm()
                return
            }
            self.filmImage.sd_addActivityIndicator()
            self.filmImage.sd_showActivityIndicatorView()
            self.filmImage.sd_setImage(with: self.randomMovie?.getImageUrl())
            self.filmImage.sd_removeActivityIndicator()
            self.realizeDate.text = self.randomMovie?.releaseDate
            self.titleLabel.text = self.randomMovie?.title
            if let voteAvg =  self.randomMovie?.voteAverage{
                self.voteAvgLabel.text = "\(String(describing: voteAvg))"
            }
            self.overViewLabel.text = self.randomMovie?.overview
            self.filmImage.isHidden = false
            SVProgressHUD.dismiss()
        }) { (error) in
            print(error)
        }
        
    }
    
    //MARK: - Views
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
    
    let getRandomButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(getRandomFilm), for: .touchUpInside)
        button.setImage(UIImage(named: "shuffle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        return button
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
        view.layer.cornerRadius = 35
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
    
}
