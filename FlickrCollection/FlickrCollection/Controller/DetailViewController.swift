//
//  DetailViewController.swift
//  FlickrCollection
//
//  Created by Nurzhigit Smailov on 3/7/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var photo: Photo!
    
    static func instantiate(photo: Photo) -> DetailViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.photo = photo
        return vc
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.sd_setImage(with: photo.getImageUrl())
        titleLabel.text = photo.title
    }
}
