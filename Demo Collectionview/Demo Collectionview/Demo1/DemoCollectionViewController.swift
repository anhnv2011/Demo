//
//  DemoCollectionViewController.swift
//  Demo Collectionview
//
//  Created by MAC on 7/17/22.
//

import UIKit
import Contacts
class DemoCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var arrImage : [String] = ["1", "2", "3", "4", "5"]
    var contact = CNContact()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        configCollection()
    }

    func configCollection(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
        }
    }

}
extension DemoCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        //print(arrImage[0])
        cell.bindData(imageName: arrImage[indexPath.row])
        //cell.containerImage.image = UIImage(named: "\(indexPath.row)")
        cell.backgroundColor = .blue
        
        return cell
    }
    
    ///set kich thước cho từng item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 32) / 3
        print(width)
        return CGSize(width: width, height: width)
        
//        let widthTbv = collectionView.bounds.width - 16
//        //return CGSize(width: widthTbv, height: 60)
//        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
   
    //set khoảng cách từng item trên 1 dòng, luôn để nhỏ hơn khoảng cách cần để để tránh làm tròn
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    // set khoang cach giua cac dong
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
   
    // set padding cho 4 canh colletion view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 100, left: 8, bottom: 200, right: 8)
    }

    
    
    //sự kiện chon item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) - row \(indexPath.row)")
    }
}

