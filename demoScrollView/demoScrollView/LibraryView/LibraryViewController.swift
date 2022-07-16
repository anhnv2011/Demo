//
//  LibraryViewController.swift
//  demoScrollView
//
//  Created by MAC on 7/14/22.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryScrollView: UIScrollView!
    
    let playlistVC = PlaylistViewController()
    let albumVC = AlbumsViewController()
    let toggleView = ToggleView()
    
    let widthScreen = UIScreen.main.bounds.width
    let heightScreen = UIScreen.main.bounds.height
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        addChildView()
        setupToggle()
    }

    func setupScrollView(){
        libraryScrollView.backgroundColor = .yellow
        libraryScrollView.isPagingEnabled = true
        libraryScrollView.contentSize = CGSize(width: widthScreen * 2, height: heightScreen)
        libraryScrollView.delegate = self
    }
    
    func addChildView(){
        addChild(playlistVC)
        libraryScrollView.addSubview(playlistVC.view)
        playlistVC.view.frame = CGRect(x: 0, y: 0, width: widthScreen, height: heightScreen)
        playlistVC.didMove(toParent: self)
        addChild(albumVC)
        libraryScrollView.addSubview(albumVC.view)
        albumVC.view.frame = CGRect(x: widthScreen, y: 0, width: widthScreen, height: heightScreen)
        albumVC.didMove(toParent: self)
    }
    
    func setupToggle(){
        view.addSubview(toggleView)
        toggleView.frame = CGRect(x: 0, y: 100, width: 200, height: 55)
        toggleView.playlistHandler = {
            self.libraryScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        toggleView.albumHandler = {
            
            self.libraryScrollView.setContentOffset(CGPoint(x: self.widthScreen, y: 0), animated: true)
        }
    }
    
}
extension LibraryViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
