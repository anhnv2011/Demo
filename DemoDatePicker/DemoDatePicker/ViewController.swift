//
//  ViewController.swift
//  DemoDatePicker
//
//  Created by MAC on 7/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        configTextField()
    }

    func configTextField (){
        //Style cho datePicker
        datePicker.datePickerMode = .date // chonj ngay thang nam
        
        //set texfiled chỉ nhận input từ datepicker ko nhận từ bàn phím
        dateTextField.inputView = datePicker
        
        
        //Chọn style cho date Picker
        datePicker.preferredDatePickerStyle = .wheels
        
        //tạo toolbar  cho datePicker
        let toolbar = UIToolbar()
        toolbar.sizeToFit() // tự động fit với kích thước input view
        let doneButton  = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(doneDatePicker))
        let cancelButton  = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([doneButton,space, cancelButton], animated: true)
        
        // gans toolbar  cho datepicker
        dateTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneDatePicker(){
        print(datePicker.date)
        let dateFormatter = DateFormatter()
        //chon dinh dang ngay thang
        dateFormatter.dateFormat = "EEEE, dd MMM yyyy"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        cancelDatePicker()
    }
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }

}

