//
//  FirstViewController.swift
//  PractivePresent
//
//  Created by MAC on 6/25/22.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self
        
    }


    @IBAction func actionRename(_ sender: UIButton) {
        
        
        let aleartController = UIAlertController(title: "Rename", message: "Enter new name", preferredStyle: .alert)
        
        //them textfield vao alearControler
        aleartController.addTextField { (textField) in
            textField.placeholder = "Type here"
            textField.text = self.nameTextField.text
        }
        aleartController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        aleartController.addAction(UIAlertAction(title: "Rename", style: .default, handler: { _ in
            if let firstTextfield = aleartController.textFields?[0] {
                self.nameTextField.text = firstTextfield.text
            }
        }))
        present(aleartController, animated: true, completion: nil)
    }
    

    @IBAction func actionShow(_ sender: UIButton) {
        let aleartController = UIAlertController(title: "Select", message: "Select view to present", preferredStyle: .actionSheet)
        aleartController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        aleartController.addAction(UIAlertAction(title: "Form", style: .default, handler: { _ in
            let vc = FormViewController()
            vc.textName = self.nameTextField.text ?? ""
            vc.handler = { name in
                self.nameTextField.text = name
            }
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }))
        
        aleartController.addAction(UIAlertAction(title: "Popup", style: .default, handler: { _ in
            let vc = PopupViewController()
            
            vc.delegate = self
            vc.nameText = self.nameTextField.text ?? ""
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
        }))
        
        // neu la ipad thi phai co doan code sau
        if UIDevice.current.userInterfaceIdiom == .pad { // kiem tra la ipa
            aleartController.popoverPresentationController?.sourceView = self.view
            aleartController.popoverPresentationController?.sourceRect = CGRect(origin: self.view.center, size: CGSize(width: 0, height: 0))
            aleartController.popoverPresentationController?.permittedArrowDirections = [.down]
        }
        present(aleartController, animated: true, completion: nil)
    }
}
extension FirstViewController: PassDataDelegate {
    func updateName(name: String) {
        nameTextField.text = name
    }
    
    
}

extension FirstViewController:UITextFieldDelegate {
    
    //hàm này gọi khi nội dung text của tf thay đổi
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
    }
    // hàm gọi khi ấn return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Ẩn bàn phím khỏi textFied đang nhap
        textField.resignFirstResponder()
        if textField == nameTextField {
            //passwordtf.becomefirstResponder
        }
        
        return true
    }
    
    //goij mỗi lần khi ấn vào nút clear
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("clear")
        return true
    }
    
}
