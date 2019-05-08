//
//  RandomViewController.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/8/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController {
    var randomMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Random Film"
        view.backgroundColor = .white
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
    }
    
    //MARK: - Views
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "random")
        image.contentMode = .scaleAspectFill
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
    
    //MARK: - Actions
    @objc func getRandomFilm(){
        RandomNetworkService.getInfo(success: { (movie) in
            self.randomMovie = Movie()
            self.randomMovie = movie
            print(self.randomMovie!)
        }) { (error) in
            print(error)
        }
        imageView.image = UIImage()
    }
    
}
