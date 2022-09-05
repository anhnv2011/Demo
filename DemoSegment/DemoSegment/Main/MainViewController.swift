//
//  MainViewController.swift
//  DemoSegment
//
//  Created by MAC on 8/11/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var containView: UIView!
    var view1: UIView!
    var view2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view1 = View1ViewController().view
        view2 = View2ViewController().view
        
        containView.addSubview(view2)
        containView.addSubview(view1)
        
        view1.frame = containView.bounds
        view2.frame = containView.bounds
    }

    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        
        case 0 :
            containView.bringSubviewToFront(view1)
        case 1:
            containView.bringSubviewToFront(view2)
        default:
            print("")
        
        }
    }
}
