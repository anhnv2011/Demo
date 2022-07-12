//
//  ViewController.swift
//  demoScrollView
//
//  Created by MAC on 7/9/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var myView: [ItemView] = []
    
    let withScreen = UIScreen.main.bounds.width
    let heightScreen = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createData()
        setupUI(myView)
        
        configPagControl()
    }
    func createData(){
        
        let item1:ItemView = Bundle.main.loadNibNamed("ItemView", owner: self, options: nil)?.first as! ItemView
        item1.photoImageView.image = UIImage(named: "Blake-Lively-Wallpapers")
        item1.descriptionTextView.text = "Mặt trời xuống biển như hòn lửa. Sóng đã cài then, đêm sập cửa.Đoàn thuyền đánh cá lại ra khơi,Câu hát căng buồm cùng gió khơi."
        
        let item2:ItemView = Bundle.main.loadNibNamed("ItemView", owner: self, options: nil)?.first as! ItemView
        item2.photoImageView.image = UIImage(named: "Blake-Lively-Wallpapers")
        item2.descriptionTextView.text = "  Hát rằng: cá bạc biển Đông lặng,Cá thu biển Đông như đoàn thoiĐêm ngày dệt biển muôn luồng sáng."
        
        let item3:ItemView = Bundle.main.loadNibNamed("ItemView", owner: self, options: nil)?.first as! ItemView
        item3.photoImageView.image = UIImage(named: "Blake-Lively-Wallpapers")
        item3.descriptionTextView.text = "Đến dệt lưới ta, đoàn cá ơi! Thuyền ta lái gió với buồm trăng Lướt giữa mây cao với biển bằng, Ra đậu dặm xa dò bụng biển,"
        
        let item4:ItemView = Bundle.main.loadNibNamed("ItemView", owner: self, options: nil)?.first as! ItemView
        item4.photoImageView.image = UIImage(named: "Blake-Lively-Wallpapers")
        item4.descriptionTextView.text = "Dàn đan thế trận lưới vây giăng. Cá nhụ cá chim cùng cá đé,"
        
        let item5:ItemView = Bundle.main.loadNibNamed("ItemView", owner: self, options: nil)?.first as! ItemView
        item5.photoImageView.image = UIImage(named: "Blake-Lively-Wallpapers")
        item5.descriptionTextView.text = "Cá song lấp lánh đuốc đen hồng, Cái đuôi em quẫy trăng vàng choé, Đêm thở: sao lùa nước Hạ Long. Ta hát bài ca gọi cá vào,"
        
        myView.append(contentsOf: [item1, item2, item3, item4, item5])
    }

    
    func setupUI(_ array:[ItemView]){
        scrollView.contentSize = CGSize(width: withScreen * CGFloat(array.count), height: heightScreen - 100)
        scrollView.showsHorizontalScrollIndicator = false
        
        // độ nảy khi kéo đến bound
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.frame = CGRect(x: 0, y: 100, width: withScreen, height: heightScreen)
        scrollView.center = view.center
        for i in 0..<array.count {
            array[i].frame = CGRect(x: withScreen * CGFloat(i), y: 100, width: withScreen, height: heightScreen - 100)
            scrollView.addSubview(array[i])
        }
    }
    func configPagControl(){
        
        scrollView.delegate = self
        pageControl.currentPage = 0
        pageControl.numberOfPages = myView.count
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .brown
//        view.bringSubviewToFront(pageControl)
        pageControl.center = CGPoint(x: view.center.x, y: view.center.y + 300)
        
    }

}
extension ViewController:UIScrollViewDelegate{


    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / withScreen
        pageControl.currentPage = Int(pageNumber)
    }
    
}
