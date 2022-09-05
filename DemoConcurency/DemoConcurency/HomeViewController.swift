//
//  HomeViewController.swift
//  DemoConcurency
//
//  Created by MAC on 8/19/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var contenView: UIView!
    @IBOutlet weak var widthConstrainButton: NSLayoutConstraint!
    @IBOutlet weak var animateButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var arrData1 = [Int]()
    var arrData2 = [Int]()
    var lastVelocityYSign = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tesstttttttt"
        configtableView()
        
        // serialQueue()
        //concurencyQueue()
        //        sync()
        //        async()
        
        //syncConcurent()
        //asyncConcurency()
       // dispatchGroup()
    }
    
    //chạy xong block sync thì mới chạy đoạn dưới, lần nào chạy cũng như nhau, 1s in ra 1 lần
    func sync(){
        print("sync")
        let queue = DispatchQueue(label: "myqueue")
        queue.sync {
            for i in 0..<10 {
                print("🔴 - thread \(Thread.current)", i)
                //sleep(1)
            }
        }
        queue.sync {
            for i in 200..<210 {
                print("🔵 - thread \(Thread.current)", i)
                //sleep(1)
            }
            
        }
        for i in 100..<110 {
            print("🔶 - thread \(Thread.current)", i)
            //sleep(1)
        }
    }
    
    //chạy lẫn lộn, mỗi lần 1 khác
    func async(){
        print("async")
        
        let queue = DispatchQueue(label: "myqueue")
        queue.async {
            for i in 0..<10 {
                print("🔴 - thread \(Thread.current)", i)
                //sleep(1)
            }
        }
        
        queue.async {
            for i in 100..<110 {
                print("🔶 - thread \(Thread.current)" , i)
                //sleep(1)
            }
        }
        queue.async {
            for i in 200..<210 {
                print("🔵 - thread \(Thread.current)", i)
                //sleep(1)
            }
            
        }
        //        for i in 100..<110 {
        //            print("test - thread \(Thread.current)", i)
        //            //sleep(1)
        //        }
    }
    
    //Giong y nhu sync
    func syncConcurent(){
        
        let queue = DispatchQueue(label: "myqueue", attributes: .concurrent)
        print("syncConcurent")
        queue.sync {
            for i in 0..<10 {
                print("🔴 - thread \(Thread.current)", i)
                sleep(1)
            }
        }
        queue.sync {
            for i in 100..<110 {
                print("🔶 - thread \(Thread.current)" , i)
                sleep(1)
            }
        }
        queue.sync {
            for i in 200..<210 {
                print("🔵 - thread \(Thread.current)", i)
                sleep(1)
            }
            
        }
    }
    func asyncConcurency(){
        
        let queue = DispatchQueue(label: "myqueue", attributes: .concurrent)
        print("asyncConcurent")
        queue.async {
            for i in 0..<10 {
                print("🔴 - thread \(Thread.current)", i)
                // sleep(1)
            }
        }
        queue.sync {
            for i in 100..<110 {
                print("🔶 - thread \(Thread.current)", i)
                // sleep(1)
            }
        }
        queue.async {
            for i in 200..<210 {
                print("🔵 - thread \(Thread.current)", i)
                // sleep(1)
            }
        }
        //        for i in 100..<110 {
        //            print("test - thread \(Thread.current)", i)
        //            //sleep(1)
        //        }
        
    }
    
    let group = DispatchGroup()
    let queue2 = DispatchQueue.global(qos: .background)

    func dispatchGroup(){
        
        /// Tác vụ 1
        queue2.async {
            self.group.enter()
            for i in 1...5 {
              
                print(i)
                Thread.sleep(forTimeInterval: 0.1)
            }
            self.group.leave()
        }
        queue2.async {
            self.group.enter()
            for i in 6...10 {
              
                print(i)
                Thread.sleep(forTimeInterval: 0.1)
            }
            self.group.leave()
        }
        queue2.async {
            self.group.enter()
            for i in 11...15 {
              
                print(i)
                Thread.sleep(forTimeInterval: 0.1)
            }
            self.group.leave()
        }
        group.notify(queue: .main) {
            print("done")
        }
        
    }
    
    func serialQueue(){
        
        let concurenecy = DispatchQueue(label: "aaaaaa")
        for i in 1...10{
            concurenecy.async {
                print("\(i) - thread \(Thread.current)")
                sleep(1)
            }
        }
        print("complete - thread \(Thread.current)")
        
    }
    func concurencyQueue(){
        
        let concurenecy = DispatchQueue(label: "aaaaaa",qos: .background, attributes: .concurrent)
        for i in 1...10{
            concurenecy.async {
                print("\(i) - thread \(Thread.current)")
                sleep(1)
            }
        }
        print("complete - thread \(Thread.current)")
        
    }
    
    func configtableView(){
        tableView.delegate = self
        tableView.dataSource = self
        for i in 0...20{
            arrData1.append(i)
            arrData2.append(i+20)
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrData1.count
        } else {
            return arrData2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        if indexPath.section == 0 {
            cell.textLabel?.text = String(arrData1[indexPath.row])
        } else if indexPath.section == 1 {
            cell.textLabel?.text = String(arrData2[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Aaaaaaaaaa"
        case 1:
            return "bbbbbbbb"
        default:
            return " "
        }
    }
      
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        if(velocity.y>0) {
            //Code will work without the animation block.I am using animation block incase if you want to set any delay to it.
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                //self.navigationController?.setToolbarHidden(true, animated: true)
                //   print("Hide")
            }, completion: nil)

        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.navigationController?.setNavigationBarHidden(false, animated: true)
              //  self.navigationController?.setToolbarHidden(false, animated: true)
                //  print("Unhide")
            }, completion: nil)
        }
    }

//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let defaultOffset = CGFloat(100)
//        print(defaultOffset)
//        let offset = scrollView.contentOffset.y + defaultOffset
//
//        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
//    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print(view.safeAreaInsets.bottom)

        let currentVelocityY =  scrollView.panGestureRecognizer.velocity(in: scrollView.superview).y
        let currentVelocityYSign = Int(currentVelocityY).signum()
        if currentVelocityYSign != lastVelocityYSign &&
            currentVelocityYSign != 0 {
            lastVelocityYSign = currentVelocityYSign
        }
        if lastVelocityYSign < 0 {
            
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.widthConstrainButton.constant = 40

            }, completion: nil)
            //print("SCROLLING DOWN")
        } else if lastVelocityYSign > 0 {
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                self.widthConstrainButton.constant = 200

            }, completion: nil)
           // print("SCOLLING UP")
        }
    }
    
}
