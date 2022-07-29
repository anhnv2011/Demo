//
//  DetailViewController.swift
//  DemoURLSession
//
//  Created by MAC on 7/26/22.
//

import UIKit
import SDWebImage
import AVFoundation
import AVKit
class DetailViewController: UIViewController {
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var artisLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    var detailMovie: Results?
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
       
    }


    func configView(){
        guard let url = URL(string: (detailMovie?.artworkUrl60!)!) else {
            return
        }
        movieImage.sd_setImage(with: url, completed: nil)
        trackLabel.text = "Track  :" + (detailMovie?.trackName)!
        artisLabel.text = "Artist :" + (detailMovie?.artistName)!
        countryLabel.text = "Country:" + (detailMovie?.country)!
        priceLabel.text = "Price:" + String(detailMovie?.trackPrice ?? 0) + "$"
        
    }
    @IBAction func actionPlayvideo(_ sender: Any) {
        guard let urlstring = detailMovie?.previewUrl else {
            return
        }
        guard let url = URL(string: urlstring) else {
            return
        }
        let player = AVPlayer(url: url)
        let vc = AVPlayerViewController()
        vc.player = player

        present(vc, animated: true) {
            vc.player?.play()
        }
    }
}

