//
//  ViewController.swift
//  Demo PickerView
//
//  Created by MAC on 7/7/22.
//

import UIKit

class ViewController: UIViewController {

    var arrMins = [0,1,2,3,4,5]
    var arrSecond = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    
    var totalSecond:Int?
    var min: Int?
    var sec: Int?
    
    var timer:Timer?
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configPickerView()
    }

    @IBAction func actionStart(_ sender: UIButton) {
        
        if let timer = timer, timer.isValid {
            timer.invalidate()
        }
        if let min = min, let sec = sec {
            var totalsecond = min*60 + sec
            timeLabel.text = "\(totalsecond)"
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
                totalsecond -= 1
                self.timeLabel.text = "\(totalsecond)"
                if totalsecond <= 0 {
                    self.timer?.invalidate()
                }
            })
        } else {
            let alert = UIAlertController(title: "error", message: "select min, second", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        }
    
    }
    
    func configPickerView (){
        
        //delegate
        pickerView.delegate = self
        
        //datasourec
        pickerView.dataSource = self
        
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Số thành phần của pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //Số lượng row cuar tung component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return arrMins.count
        } else {
            return arrSecond.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(arrMins[row])
        } else {
            return String(arrSecond[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("did select row at \(row) in componet \(component)")
        
        if component == 0 {
            min = arrMins[row]
        } else {
            sec = arrSecond[row]
        }
    }
}


