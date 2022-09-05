//
//  SecondViewController.swift
//  DemoAnimation
//
//  Created by MAC on 8/30/22.
//

import UIKit

class SecondViewController: UIViewController {

    var data: CellData!

    @IBOutlet private(set) var locationImageView: UIImageView!
    @IBOutlet private(set) var locationLabel: UILabel!
    @IBOutlet private(set) var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let cross = #imageLiteral(resourceName: "cross").withRenderingMode(.alwaysTemplate)
        closeButton.setImage(cross, for: .normal)
        closeButton.tintColor = .white

        locationImageView.image = data.image
        locationLabel.text = data.title
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }

}
