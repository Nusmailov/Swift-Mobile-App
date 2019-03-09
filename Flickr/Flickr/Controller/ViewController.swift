//
//  ViewController.swift
//  Flickr
//
//  Created by Nurzhigit Smailov on 3/6/19.
//  Copyright © 2019 Nurzhigit Smailov. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire

class ViewController: UIViewController {
    var info = [Photos]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadInfo()
    }
    func loadInfo(){
        SVProgressHUD.show()
        FlickrService.getInfoList(success: { (info) in
            SVProgressHUD.dismiss()
            self.info = info
            self.collectionView.reloadData()
            print(self.info)
            print("done")
        }) { (error) in
            SVProgressHUD.dismiss()
            print("error")
        }
    }
    

}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath) as! InfoCollectionViewCell
        cell.text.text = "\(indexPath.row)"
        return cell
    }
}

