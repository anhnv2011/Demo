//
//  CoinDeskViewController.swift
//  DemoURLSession
//
//  Created by MAC on 7/26/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class CoinDeskViewController: UIViewController {

    var coin:CoinDesk?
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    }

    func getData(){
        guard let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice.json") else {
            print("invalid value")
            return
        }
      
        let parameters: Parameters = ["foo": "bar"]

        
        Alamofire.request(url, method: .get, parameters: .none, encoding: JSONEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseJSON { response in
                //debugPrint(response)
                self.coin = CoinDesk(JSON(response.result.value))
                print(self.coin)
            }
//        Alamofire.request(url).responseJSON { (response) in
//            guard let value = response.result.value else {
//                print("Nodata")
//                return
//            }
//        
//        
//            
//        }
        
    }
   
}
