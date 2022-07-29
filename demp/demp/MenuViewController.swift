//
//  MenuViewController.swift
//  demp
//
//  Created by MAC on 7/18/22.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    func didSelectMenu (menuItem: MenuOptions)
}
enum MenuOptions: String, CaseIterable {
    case home = "Home"
    case settings = "Setting"
    case info = "Information"
    case appRating = "App Rating"
    case shareApp = "Share App"
    
    var imageName: String {
        switch self {
        case .home:
            return "house"
        case .settings:
            return "gear"
        case .info:
            return "airplane"
        case .appRating:
            return "star"
        case .shareApp:
            return "message"
        }
    }
}


class MenuViewController: UIViewController {
   
    weak var menuDelegate:MenuViewControllerDelegate?

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = nil
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(tableView)
        title = "Menu"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.bottom, width: view.bounds.size.width, height: view.bounds.size.height)
    }
    
}
extension MenuViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //tong so case cua enum
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
        cell.backgroundColor = nil
        cell.imageView?.image  = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
        //cell.imageView?.tintColor = .white
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //un highlight
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOptions.allCases[indexPath.row]
        menuDelegate?.didSelectMenu(menuItem: item)
    }
    
}
