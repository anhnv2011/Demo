//
//  ViewController.swift
//  DemoWebview
//
//  Created by MAC on 8/5/22.
//

import UIKit
import  WebKit

class ViewController: UIViewController {

    let webView = WKWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        guard let url = URL(string: "https://www.google.com/") else {
            print("invalid url")
            return
        }
        webView.load(URLRequest(url: url))
    }

    override func viewDidLayoutSubviews() {
        webView.frame = view.bounds
    }

}

