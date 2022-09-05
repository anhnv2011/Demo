//
//  ViewController.swift
//  tesst
//
//  Created by MAC on 8/8/22.
//

import UIKit

class ViewController: UIViewController {
    var arradata = [CurrenLocation]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    
    func getData(){
        guard let url = URL(string: "http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/353412?apikey=90LKUI4g3wxlc1GAd1Vh1tqFVc1KZvvG&details=true&metric=true") else {
            print("URL khong ton tai")
            return
        }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                // neu co loi xay ra
                print(error.localizedDescription)
            } else {
                print(data)
                
                
                do {
                    self.arradata = try JSONDecoder().decode([CurrenLocation].self, from: data!)
                    DispatchQueue.main.async { [self] in

                        print(arradata)
                    }
//                    let result = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments)
//                    print(result)
                    
                } catch  {
                    print(error.localizedDescription)
                }
                
                
                
                
                
            }
        }.resume()
    }
    
    
}

