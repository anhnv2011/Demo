//
//  MenuViewController.swift
//  DemoSideMenu
//
//  Created by MAC on 7/12/22.
//

import UIKit

protocol MenuViewDelegate {
    func didSelectedMenu(menuItem: SideMenuItem)
}
enum SideMenuItem:String, CaseIterable {
    case home = "Home"
    case infor = "Information"
    case setting = "Setting"
}
class MenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var delegateMenu:MenuViewDelegate?
    
    let menuItem:[SideMenuItem]
    
    init(with menuItem: [SideMenuItem]) {
       
        self.menuItem = menuItem
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
      
    }

    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .darkGray
    }

    

}
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItem[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .darkGray
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let seletedItem = menuItem[indexPath.row]
        delegateMenu?.didSelectedMenu(menuItem: seletedItem)
    }
    
    
}
