//
//  AnimeViewController.swift
//  DemoURLSession
//
//  Created by MAC on 7/26/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class AnimeViewController: UIViewController {

    var arrAnime:[Data] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        getData()
    }

    func getData(){
        guard let url = URL(string: "https://anime-facts-rest-api.herokuapp.com/api/v1") else {
            return
        }
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            guard let value = response.result.value else { // value : dữ liệu trả về
                print("No data response")
                return
            }
            let data = Anime(JSON(value)).data
            self.arrAnime = data!
            //print(self.arrAnime)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
      
        }
        
    }
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }

}
extension AnimeViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return anime?.data?.count ?? 0
        arrAnime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        //cell.textLabel?.text = String(arrAnime[indexPath.row].animeId!)
        cell.detailTextLabel?.text = arrAnime[indexPath.row].animeName
        print(arrAnime[indexPath.row].animeName)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    
}
