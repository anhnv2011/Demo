//
//  ItunesViewController.swift
//  DemoURLSession
//
//  Created by MAC on 7/26/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class ItunesViewController: UIViewController {

    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    var dataSearch:[Results] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(searchString: "harry")
        print(dataSearch)

        searchTextfield.delegate = self

      configCollectionView()
    }

    func getData(searchString: String){

        
        let url = "https://itunes.apple.com/search?"
        let parameters: Parameters = [
            "term" : "\(searchString)",
            "limit": "10"
        ]
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: nil).responseJSON(completionHandler: { (response) in
            guard let value = response.result.value else {
                return
            }
            
            self.dataSearch = Itunes(JSON(value)).results!
            self.collectionView.reloadData()
            
        })
    }
    func configCollectionView(){
    
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ItuneCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
    
    
}
extension ItunesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItuneCollectionViewCell
        cell.configCell(name: dataSearch[indexPath.row].trackName ?? "", imageURL: dataSearch[indexPath.row].artworkUrl60 ?? "")
        cell.backgroundColor = .red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 16)/2
        return CGSize(width: width, height: width + 40 )
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailMovie = dataSearch[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
extension ItunesViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            print(text)
            getData(searchString: text)
        } else {
           
        }
        collectionView.reloadData()
    }
}
