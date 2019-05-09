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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Random Film"
        view.backgroundColor = .black
        view.addSubview(imageView)
        view.addSubview(getRandomButton)
        
        imageView.snp.makeConstraints { (make) in
            make.bottom.top.right.left.equalToSuperview()
        }
        getRandomButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(80)
        }
        
        setFilmViews()
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
            make.height.width.equalTo(150)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(filmImage.snp.right).offset(8)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(35)
            make.right.equalToSuperview().offset(-8)
        }
        realizeDate.snp.makeConstraints { (make) in
            make.left.equalTo(filmImage.snp.right).offset(8)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        voteAvgLabel.snp.makeConstraints { (make) in
            make.top.equalTo(realizeDate.snp.bottom).offset(8)
            make.left.equalTo(filmImage.snp.right).offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        overViewLabel.snp.makeConstraints { (make) in
            make.top.equalTo(filmImage.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
    //MARK: - Views
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "random")
        image.contentMode = .scaleAspectFill
        return image
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
    
    let getRandomButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(getRandomFilm), for: .touchUpInside)
        button.setImage(UIImage(named: "shuffle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        return button
    }()
    let realizeDate:UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = label.font.withSize(15)
        label.numberOfLines = 0
        return label
    }()
    let voteAvgLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = label.font.withSize(15)
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
    //MARK: - Actions
    @objc func getRandomFilm(){
        RandomNetworkService.getInfo(success: { (movie) in
            self.randomMovie = movie
            if self.randomMovie?.backdropPath == "" || self.randomMovie?.overview == ""{
                self.getRandomFilm()
                return
            }
            self.filmImage.sd_setImage(with: self.randomMovie?.getImageUrl())
            self.realizeDate.text = self.randomMovie?.releaseDate
            self.titleLabel.text = self.randomMovie?.title
            
            if let voteAvg =  self.randomMovie?.voteAverage{
                self.voteAvgLabel.text = "\(String(describing: voteAvg))"
            }
            self.overViewLabel.text = self.randomMovie?.overview
        }) { (error) in
            print(error)
        }
        imageView.image = UIImage()
    }
    

    
   
}
