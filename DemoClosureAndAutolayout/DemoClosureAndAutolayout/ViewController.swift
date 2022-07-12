//
//  ViewController.swift
//  DemoClosureAndAutolayout
//
//  Created by MAC on 6/30/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var opendoor: UIView!
    
    let getName = { (name: String) -> String in
        return "ten la: \(name)"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(getName("asdsdasd"))
        UIView.animate(withDuration: 1, delay: 1) { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.view.backgroundColor = .red
        } completion: { (_) in
            self.view.backgroundColor = .yellow
        }

        
        taxi("anh", move: { (name) in
            donkhach(name: name)
        }, "Ha dong")
        
        getData { (respond) in
            print(respond)
        } _: { (error) in
            print(error)
        }


    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        opendoor.layer.cornerRadius = 15
    }

    func taxi (_ tenkhach: String, move: ((String)-> Void), _ diemden: String){
        print("don khach co ten la \(tenkhach)")
        move(tenkhach)
        print("dua khac den \(diemden) thanh cong")
    }
    func donkhach(name : String){
        print("don khach \(name) thanh cong")
    }
    func getData (_ success: ((Any) -> Void), _ failure: ((_ error: String) -> Void)){
        let isGetdata = true
        if isGetdata {
            success("asdas")
        } else {
            failure("error")
        }
    }

}

