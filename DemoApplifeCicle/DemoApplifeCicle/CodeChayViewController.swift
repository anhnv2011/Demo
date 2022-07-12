//
//  CodeChayViewController.swift
//  DemoApplifeCicle
//
//  Created by MAC on 7/2/22.
//

import UIKit

class CodeChayViewController: UIViewController {

    let containerView:UIView = {
        let view = UIView()
       //tat che do fram
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    let content:UIView = {
        let view = UIView()
       //tat che do fram
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person")
        return image
    }()
    let slolgan :UILabel = {
        let label = UILabel()
        label.text = "aaaaaaaaaaaaaaaaaaaaaaaaaaa"
        return label
    }()
    let imageView2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "sun.min.fill")
        return image
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpLayout()
    }
    

    func setUpLayout(){
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        
        containerView.addSubview(content)
        content.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        content.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        content.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        content.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 3/4).isActive = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        content.layer.cornerRadius = 40
        content.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
