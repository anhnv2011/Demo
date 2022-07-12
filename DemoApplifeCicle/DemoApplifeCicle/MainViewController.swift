//
//  MainViewController.swift
//  DemoApplifeCicle
//
//  Created by MAC on 7/2/22.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        let lable = UILabel()
        lable.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        lable.text = "diss miss"
        lable.center = view.center
        
        let tapGestere = UITapGestureRecognizer(target: self, action: #selector(tapOnDissmiss))
        lable.isUserInteractionEnabled = true
        lable.addGestureRecognizer(tapGestere)
        view.addSubview(lable)
    }

    deinit {
        print("View2 da bi huy")
    }
    override func loadView() {
        super.loadView()
        print("load view2")
    }
    @objc func tapOnDissmiss(){
        self.dismiss(animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear2222")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear2222")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear222")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear2222")
    }

}
