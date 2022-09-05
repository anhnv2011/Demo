//
//  CollectionViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/30/22.
//

import UIKit

class CollectionViewController: UIViewController {

    var selectedCell: CollectionViewCell?
    var selectedCellImageViewSnapshot: UIView?
    var animator: Animator2?

    @IBOutlet private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCellIdentifier")

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.cellSpacing
        layout.minimumInteritemSpacing = Constants.cellSpacing

        collectionView.setCollectionViewLayout(layout, animated: false)
    }

    
    func presentSecondViewController(with data: CellData) {
        let secondViewController = SecondViewController()
//        secondViewController.view.alpha = 0.1
        
        // 4
        secondViewController.transitioningDelegate = self

        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.data = data
        present(secondViewController, animated: true)
    }
    
}


extension CollectionViewController: UIViewControllerTransitioningDelegate {

    // 2
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // 16
        guard let firstViewController = presenting as? CollectionViewController,
            let secondViewController = presented as? SecondViewController,
            let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
            else { return nil }

        animator = Animator2(type: .present, firstViewController: firstViewController, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }

    // 3
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // 17
        guard let secondViewController = dismissed as? SecondViewController,
            let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
            else { return nil }

        animator = Animator2(type: .dismiss, firstViewController: self, secondViewController: secondViewController, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
}
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellIdentifier", for: indexPath) as! CollectionViewCell
        cell.configure(with: DataManager.data[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 6
        selectedCell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        // 7
        selectedCellImageViewSnapshot = selectedCell?.locationImageView.snapshotView(afterScreenUpdates: false)
        
        presentSecondViewController(with: DataManager.data[indexPath.row])
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - Constants.cellSpacing) / 2
        return .init(width: width, height: width)
    }
}
extension CollectionViewController {

    enum Constants {

        static let cellSpacing: CGFloat = 8
    }
}
