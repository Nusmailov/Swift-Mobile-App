//
//  ViewController.swift
//  FlickrCollection
//
//  Created by Nurzhigit Smailov on 3/7/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import SVProgressHUD
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var photos = [Photo]()
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Flickr"
        loadInfo()
    }
    
    
    func loadInfo() {
        SVProgressHUD.show()
        InfoService.getInfo(success: { (info) in
            SVProgressHUD.dismiss()
            self.photos = info
            self.collectionView.reloadData()
        }) { (error) in
            SVProgressHUD.dismiss()
            print("error")
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionViewCell
        let photo = photos[indexPath.item]
        cell.imageView!.sd_setImage(with:photo.getImageUrl())
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        let photo = photos[indexPath.item]

        let vc = DetailViewController.instantiate(photo: photo)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
   
    
}

