//
//  ViewController.swift
//  DemoApplifeCicle
//
//  Created by MAC on 7/2/22.
//

import UIKit

class ViewController: UIViewController {

    deinit {
        print("View da bi huy")
    }
    override func loadView() {
        super.loadView()
        print("load view")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View DID load")
        
        let lable = UILabel()
        lable.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        lable.text = "present"
        lable.center = view.center
        let tapGestere = UITapGestureRecognizer(target: self, action: #selector(tapOnPresent))
        lable.isUserInteractionEnabled = true
        lable.addGestureRecognizer(tapGestere)
        view.addSubview(lable)
    }

    @objc func tapOnPresent(){
        let mainvc = MainViewController()
        mainvc.modalPresentationStyle = .fullScreen
        self.present(mainvc, animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
}

