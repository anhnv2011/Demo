//
//  ThirdCollectionViewCell.swift
//  Demo Collectionview
//
//  Created by MAC on 7/18/22.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionViea: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }

    func configureCollectionView(){
        collectionViea.delegate = self
        collectionViea.dataSource = self
        collectionViea.register(UINib(nibName: "ThirdCollectionViewCellCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        if let flowLayout = collectionViea.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        collectionViea.isPagingEnabled = true
        collectionViea.showsHorizontalScrollIndicator = false
    }
    func configPageControl(){
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .black
        
    }
}
extension ThirdCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViea.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionViea.bounds.width 
        return CGSize(width: width, height: 150)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = collectionViea.contentOffset.x / (bounds.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
}
