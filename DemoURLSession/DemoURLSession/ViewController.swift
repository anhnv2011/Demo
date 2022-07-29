//
//  ViewController.swift
//  DemoURLSession
//
//  Created by MAC on 7/23/22.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
//    https://jsonplaceholder.typicode.com/posts
    
    var arrPost = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        //getPost()
        //getPostByAlamofire()
        //uploadPost()
        test()
        
    }

    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }

    func test(){
        guard let url = URL(string: "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=dc7bb41154658ee8cd23ecf49d7203c2&username=anhnv2011&password=12345678&request_token=2e3654d4c210bbffe10dffe71efc5c9ac49c5000") else {
            print("URL khong ton tai")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let param = [
            "username": "anhnv2011",
            "password": "12345678",
            "request_token": "2e3654d4c210bbffe10dffe71efc5c9ac49c5000"
        ] as [String: AnyObject]
        let paramData = try? JSONSerialization.data(withJSONObject: param)
        urlRequest.httpBody = paramData
        urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print(response)
                print("---------------------------")
                print(data)
                do {
                    let jsonFromData = try JSONSerialization.jsonObject(with: data!)
                    print(jsonFromData)
                    
                } catch  {
                    
                }
            }
        }.resume()
    }
    func uploadPost(){
        // Tạo URL request
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("URL khong ton tai")
            return
        }
        //Tao urlRequest
        var urlRequest = URLRequest(url: url)
        
        //set method
        urlRequest.httpMethod = "POST"
        
        //Tao đoạn body truyền lên
        let param = [
            "title": "anhnv",
            "body": "up post"
        ] as [String: AnyObject]
        
        //convert sang kieu du lieu data
        let paramData = try? JSONSerialization.data(withJSONObject: param)
        
        //truyền body/paramnhw nhau (nếu dùng alamofire thì 2 cái khác nhau)
        urlRequest.httpBody = paramData
        urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        //Request  lên server
        let session = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
               // print(response)
            }
        }
        session.resume()
        
    }
    
    func getPostByAlamofire(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("URL khong ton tai")
            return
        }
        Alamofire.request(url).responseJSON { (response) in
            print(response.data)
            print(response.result.isSuccess) //co thanh cong hay ko
            print(response.error?.localizedDescription)
            
            //print(response)
            
            guard let value = response.result.value else { // value : dữ liệu trả về
                print("No data response")
                return
            }
            
            let result = JSON(value) // ép về kiểu json chuẩn
            
            let dataJson = result.arrayValue
            print(dataJson.first)
        
            //self.arrPost = dataJson.map({Post($0)}) //ép kiểu nó về Post
            self.arrPost = dataJson.map({ item in
                Post(item)
                
            })
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    func getPost(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("URL khong ton tai")
            return
        }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                // neu co loi xay ra
                print(error.localizedDescription)
            } else {
                print(data)
               
                
                
                //c1 : đọc dữ liệu bằng decode
//                do {
//                    self.arrPost = try JSONDecoder().decode([Post].self, from: data!)
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                    }
//
//                } catch  {
//                    print(error.localizedDescription)
//                }
//
//
                
                
//                c2
                do {
                    let jsonFromData = try JSONSerialization.jsonObject(with: data!)
                    print(jsonFromData)
                    for data in jsonFromData as! [Dictionary<String, AnyObject>] {
                        var itemPost = Post()
                        itemPost.userId = data["userId"]! as! Int
                        itemPost.id = data["id"]! as! Int
                        itemPost.title = data["title"]! as! String
                        itemPost.body = data["body"]! as! String
                        
                        self.arrPost.append(itemPost)
                        
                        
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let error {
                    print(error.localizedDescription)
                }

            }
        }.resume()
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = arrPost[indexPath.row].title
        cell.detailTextLabel?.text = arrPost[indexPath.row].body
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    
}
