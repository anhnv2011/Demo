//
//  HomeViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/29/22.
//

import UIKit
enum animate: CaseIterable {
    case basicAnimation
    case coreAnimation
    case properAnimation
    case transition
    case keyframe
    case group
    case CASpringAnimation
    case ShapesMasksLayer
    case PresentationAnimation
    case collectionView
    case tableView
    var detailTitle:String{
        switch self {
        case .basicAnimation:
            return "Base animation"
        case .coreAnimation:
            return "Demo Core Animation- shake textfield"
        case .properAnimation:
            return "Demo UIViewPropertyAnimator"
        case .transition:
            return "Transition"
        case .keyframe:
            return "Keyframe"
        case .group:
            return "Group & Timing"
        case .CASpringAnimation:
            return "CASpringAnimation"
        case .ShapesMasksLayer:
            return "Shapes và Masks Layer"
        case .PresentationAnimation:
            return "Presentation Animation"
        case .collectionView:
            return "Collection View cell"
        case .tableView:
            return "tableview"
        }
    }

    var view:UIViewController{
        switch self {
        case .basicAnimation:
            return BasicAnimationViewController()
        case .coreAnimation:
            return DemoCoreAnimationViewController()
        case .properAnimation:
            return DemoPropertyAnimationViewController()
        case .transition:
            return TransitionsViewController()
        case .keyframe:
            return KeyFrameViewController()
        case .group:
            return GroupTimingViewController()
        case .CASpringAnimation:
            return CASpringAnimationViewController()
        case .ShapesMasksLayer:
            return ShapesMasksLayerViewController()
        case .PresentationAnimation:
            return PresentationAnimationViewController()
        case .collectionView:
            return CollectionViewController()
        case .tableView: 
            return TableViewController()
        }
    }
}
class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
        
}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animate.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(indexPath.row + 1)" + ". " +  animate.allCases[indexPath.row].detailTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = animate.allCases[indexPath.row].view
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
