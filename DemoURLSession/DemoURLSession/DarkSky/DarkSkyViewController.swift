//
//  DarkSkyViewController.swift
//  DemoURLSession
//
//  Created by MAC on 7/26/22.
//

import UIKit

class DarkSkyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    }


    func getData(){
        let headers = [
            "X-RapidAPI-Key": "e323a89b3bmsh63978452fe399cap14192cjsn3ebdea7af415",
            "X-RapidAPI-Host": "dark-sky.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://dark-sky.p.rapidapi.com/%7Blatitude%7D,%7Blongitude%7D?units=auto&lang=en")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                //print(httpResponse)
                do {
                let jsonFromData = try JSONSerialization.jsonObject(with: data!)
                    print(jsonFromData)} catch {}
            }
            
        
        })

        dataTask.resume()
    }

}
