//
//  ViewController.swift
//  DemoImagePicker
//
//  Created by MAC on 7/7/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contenImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contenImageView.image = UIImage(systemName: "square.and.arrow.up")
    }

    @IBAction func actionOpenCamer(_ sender: UIButton) {
        //UIImagePickerController: Su dung để chọn ảnh từ camera hoặc album ảnh của iphone
        //kiểm tra  xem thiết bị có sử  dụng được camera không
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            //mở camera
            
            // khởi tạo imagepickerController
            let imagePicker = UIImagePickerController()
            
            //Chọn nguồn ảnh
            imagePicker.sourceType = .camera
            
            //Cho phép sửa ảnh
            imagePicker.allowsEditing = true
            
            
            // Kế thừa các phương thức
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
            
            //MARK : - thêm infor.plit Privacy - Camera Usage Description
        } else {
            //thoong báo ko có camera
            let alert = UIAlertController(title: "Errror", message: "Dont have camare", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func actionOpenGalary(_ sender: UIButton) {
        //UIImagePickerController: Su dung để chọn ảnh từ camera hoặc album ảnh của iphone
        //kiểm tra  xem thiết bị có sử  dụng được photolibrar không
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            //mở camera
            
            // khởi tạo imagepickerController
            let imagePicker = UIImagePickerController()
            
            //Chọn nguồn ảnh
            imagePicker.sourceType = .photoLibrary
            
            //Cho phép sửa ảnh
            imagePicker.allowsEditing = true
            
            
            // Kế thừa các phương thức
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
            
            //MARK : - thêm infor.plit Privacy - Camera Usage Description
        } else {
            //thoong báo ko có camera
            let alert = UIAlertController(title: "Errror", message: "Dont have permission", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        // nếu cho phép người dùng chỉnh sửa thì lấy ra editImage, nếu không thì lấy ra originalImage
        guard let image = info[.editedImage] as? UIImage else {
            print("no image")
            return
        }
      
        print("asdád ", image)
        contenImageView.image = image
    }
}
