//
//  TableViewController.swift
//  DemoAnimation
//
//  Created by MAC on 7/30/22.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        animateTable()
    }

    func animateTable(){
        tableView.reloadData()
        let cells = tableView.visibleCells
       
        let tableViewHight = tableView.bounds.size.height
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHight)
//            print(CGAffineTransform(translationX: 0, y: tableViewHight))
        }
        var delayCount = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCount) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn) {
                cell.transform = CGAffineTransform.identity
            } completion: { (_) in

            }
            delayCount += 1


        }
    }
    var lastVelocityYSign = 0
}
extension TableViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
     let currentVelocityY =  scrollView.panGestureRecognizer.velocity(in: scrollView.superview).y
     let currentVelocityYSign = Int(currentVelocityY).signum()
     if currentVelocityYSign != lastVelocityYSign &&
        currentVelocityYSign != 0 {
            lastVelocityYSign = currentVelocityYSign
     }
     if lastVelocityYSign < 0 {
       print("SCROLLING DOWN")
     } else if lastVelocityYSign > 0 {
       print("SCOLLING UP")
     }
    }

}
