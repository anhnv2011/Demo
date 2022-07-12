//
//  ViewController.swift
//  DemoStackViewCode
//
//  Created by MAC on 7/7/22.
//

import UIKit

class ViewController: UIViewController {

    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLayout()
    }

    let hozirontalStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 8
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.backgroundColor = .brown
        
        return view
    }()

    func setupLayout(){
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        containerView.addSubview(hozirontalStackView)
        hozirontalStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        hozirontalStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        hozirontalStackView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier:0.9).isActive = true
        hozirontalStackView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier:0.3).isActive = true
        
        
        for i in 0...3 {
            // Add button
            let button = UIButton()
            button.backgroundColor = .red
            button.setTitle("slect \(i)", for: .normal)
            button.tag = i
            button.addTarget(self, action: #selector(actionSelectButton(_: )), for: .touchUpInside)
            hozirontalStackView.addArrangedSubview(button)
            
        }
        
    }
    @objc func actionSelectButton(_ sender: UIButton){
        switch sender.tag {
        case 0:
            print("btn1")
        case 1 :
            print("aaaa")
        case 2 :
            print("sss")
        default:
            print("gggg")
        }
        
        print(sender.titleLabel?.text as Any)
    }
}

