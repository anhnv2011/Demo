//
//  DrinkWaterViewController.swift
//  DemoApplifeCicle
//
//  Created by MAC on 7/2/22.
//

import UIKit

class DrinkWaterViewController: UIViewController {

    var timer:Timer!
    @IBOutlet weak var topConstrain: NSLayoutConstraint!
    @IBOutlet weak var drinkView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    
        
    }
    
    var count: CGFloat = 0
    @objc func runTimer(){
        count += 1
        self.topConstrain.constant = count
        if count >= self.view.frame.height - 50 {
            timer.invalidate()
        }
    }

    

}
