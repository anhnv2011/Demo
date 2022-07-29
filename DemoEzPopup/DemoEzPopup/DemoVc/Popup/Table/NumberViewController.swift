//
//  NumberViewController.swift
//  DemoEzPopup
//
//  Created by MAC on 7/27/22.
//

import UIKit

protocol NumberViewControllerDelegate {
    func didSelectedNumber(sender: NumberViewController,number: Int)
}

class NumberViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var delegate: NumberViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
       
    }

    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}
extension NumberViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectedNumber(sender: self, number: indexPath.row)
       // delegate?.numberPickerViewController(sender: self, didSelectNumber: indexPath.row)
    }
}
