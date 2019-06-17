//
//  MoviePhotoTableViewCell.swift
//  Cinema
//
//  Created by Nurzhigit Smailov on 5/10/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit

class MoviePhotoTableViewCell: UITableViewCell {
    // MARK: - Properties
    var movie_id = Int()
    
    let movieImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var starButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "star"), for: .normal)
        button.isEnabled = true
        button.addTarget(self, action: #selector(addToHistory(sender:)), for: .touchUpInside)
        return button
    }()
    
    let starBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    let raitingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    let realizeDate: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 18)//UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        label.backgroundColor = .white
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        return label
    }()
    
    let raitingLabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 18)//UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        return label
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 18)//UIFont.boldSystemFont(ofSize: 24.0)
        label.numberOfLines = 0
        label.backgroundColor = .white
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        return label
    }()
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Views
    func setupViews() {
        contentView.addSubview(movieImage)
        movieImage.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        
        movieImage.addSubview(raitingView)
        movieImage.addSubview(realizeDate)
        movieImage.addSubview(nameLabel)
        raitingView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(16)
            make.width.height.equalTo(50)
        }
        raitingView.addSubview(raitingLabel)
        raitingLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        realizeDate.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(realizeDate)
            make.bottom.equalTo(realizeDate.snp.top).offset(-8)
        }
        contentView.addSubview(starBackView)
        starBackView.addSubview(starButton)
        starBackView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(16)
            make.height.width.equalTo(50)
        }
        starButton.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(40)
        }
    }
    
    // MARK: - Methods
    @objc func addToHistory(sender :UIButton) {
        let defaults = UserDefaults.standard
        var myarray = defaults.array(forKey: "movieidList")  as? [Int] ?? [Int]()
        if starButton.imageView?.image == UIImage(named: "star"){
            starButton.setImage(UIImage(named: "starGold"), for: .normal)
            if !myarray.contains(movie_id) {
                //add element
                myarray.append(movie_id)
                print(myarray)
            }
            defaults.set(myarray, forKey: "movieidList")
        } else {
            starButton.setImage(UIImage(named: "star"), for: .normal)
            let defaults = UserDefaults.standard
            var myarray = defaults.array(forKey: "movieidList")  as? [Int] ?? [Int]()
            if myarray.contains(movie_id) {
                //remove
                myarray.remove(at: myarray.firstIndex(of: movie_id)!)
                print(myarray)
            }
            defaults.set(myarray, forKey: "movieidList")
        }
    }
    
    
}
