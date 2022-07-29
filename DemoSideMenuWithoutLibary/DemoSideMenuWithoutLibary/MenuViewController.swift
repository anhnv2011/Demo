//
//  MenyViewController.swift
//  DemoSideMenuWithoutLibary
//
//  Created by MAC on 7/18/22.
//

import UIKit

protocol MenuViewControllerDelegate {
    func didTapMenu(sender:MenuViewController, menuOption: MenuOptions)
}
class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var delegate: MenuViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        configureTableView()
    }

    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}
extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.image = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
        cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didTapMenu(sender: self, menuOption: MenuOptions.allCases[indexPath.row])
    }
    
}
