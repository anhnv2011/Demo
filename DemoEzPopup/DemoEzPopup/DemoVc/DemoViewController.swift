//
//  DemoViewController.swift
//  DemoEzPopup
//
//  Created by MAC on 7/27/22.
//

import UIKit
import EzPopup

class DemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBOutlet weak var topButton: UIButton!
    
    @IBAction func center(_ sender: Any) {
        //let vc = NumberViewController()
//        let popVC = PopupViewController(contentController: vc, position: .center(CGPoint(x: 0, y: 0)), popupWidth: 100, popupHeight: 100)
        let vc = AlertViewController()
       
        vc.titleString = "asddasdsad"
        vc.messageString  = "xvxvvxcvxcvx"
        let popVC = PopupViewController(contentController: vc, popupWidth: 300, popupHeight: 300)
        present(popVC, animated: true, completion: nil)
    
    }
    
    @IBAction func topLeft(_ sender: Any) {
        let vc = NumberViewController()
        let popVC = PopupViewController(contentController: vc, position: .topLeft(CGPoint(x: 20, y: 20)), popupWidth: 200, popupHeight: 200)
        present(popVC, animated: true, completion: nil)
    }
    
    @IBAction func topRight(_ sender: Any) {
        let vc = NumberViewController()
        let popVC = PopupViewController(contentController: vc, position: .topRight(CGPoint(x: 20, y: 20)), popupWidth: 200, popupHeight: 200)  //x: cách viền phải, y cách top
        present(popVC, animated: true, completion: nil)
    }
    
    @IBAction func bottomLeft(_ sender: Any) {
        let vc = NumberViewController()
        let popVC = PopupViewController(contentController: vc, position: .bottomLeft(CGPoint(x: 0, y: 0)), popupWidth: 200, popupHeight: 200)
        present(popVC, animated: true, completion: nil)
    }
    
    @IBAction func bottomRight(_ sender: Any) {
        let vc = NumberViewController()
        let popVC = PopupViewController(contentController: vc, position: .bottomRight(CGPoint(x: 0, y: 0)), popupWidth: 200, popupHeight: 200)
        present(popVC, animated: true, completion: nil)
    }
    
    @IBAction func Top(_ sender: Any) {
        let vc = NumberViewController()
        let popVC = PopupViewController(contentController: vc, position: .top(100), popupWidth: 100, popupHeight: 100)
        present(popVC, animated: true, completion: nil)
    }
    
    @IBAction func left(_ sender: Any) {
    }
    
    
    @IBAction func bottom(_ sender: Any) {
    }
    
    
    @IBAction func right(_ sender: Any) {
    }
    
    
    @IBAction func offSetFromView(_ sender: Any) {
        let vc = NumberViewController()
        let popVC = PopupViewController(contentController: vc, position:.offsetFromView(CGPoint(x: 10, y: topButton.frame.height), topButton), popupWidth: 100, popupHeight: 100) //x, y là mixX, minY của nút
        present(popVC, animated: true, completion: nil)
    }
    
    @IBOutlet weak var customButton: UIButton!
    @IBAction func actionCustomButton(_ sender: Any) {
        let vc = NumberViewController()
        let popVC = CustomPopupViewController(contentController: vc, offset: CGPoint(x: 0, y: customButton.frame.height), anchorView: customButton, popupWidth: 100, popupHeight: 100)
        present(popVC, animated: true, completion: nil)
    }
    
    
}
extension DemoViewController: NumberViewControllerDelegate {
    func didSelectedNumber(sender: NumberViewController, number: Int) {
        print(number)
        dismiss(animated: true, completion: nil)
    }
    
    
}
extension DemoViewController: PopupViewControllerDelegate {
    
}
