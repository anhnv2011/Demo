//
//  ViewController.swift
//  Demo Keychain
//
//  Created by MAC on 8/23/22.
//

import UIKit
import Security
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        addItem()
//        addItemAndStatus()
//        addItemAndReturnAtributes()
//        addItemAndReturnData()
//        retrievingItems()
//        retrievingItem()
//        updateItems()
        updateItem()
        
    }


    func addItem(){
        /*Item class được quy định bằng key kSecClass. Và kiểu được dùng là một generic password.
        Giá trị dữ liệu sẽ được mã hóa và được khai báo bằng key kSecValueData
        Sau cùng bạn cần ép kiểu về CFDictionary
        */
        let query = [
            kSecValueData: "anhnv".data(using: .utf8)!,
            kSecClass: kSecClassGenericPassword
        ] as CFDictionary
    
        let status = SecItemAdd(query, nil)
        print("Status: \(status)")
    }
    
    func addItemAndStatus() {
        let query = [
            kSecValueData: "anhnv_keychain".data(using: .utf8)!,
            kSecAttrAccount: "anhnv2011",
            kSecAttrServer: "google",
            kSecClass: kSecClassInternetPassword
        ] as CFDictionary

        let status = SecItemAdd(query, nil)
        print("Status: \(status)")
    }
    
    func addItemAndReturnAtributes() {
  
        let query = [
            kSecValueData: "anhnv_keychain".data(using: .utf8)!,
            kSecAttrAccount: "anhnv2011",
            kSecAttrServer: "google.com",
            kSecClass: kSecClassInternetPassword,
            kSecReturnAttributes: true
        ] as CFDictionary

        var ref: AnyObject?

        let status = SecItemAdd(query, &ref)
        print("Status: \(status)")
        print("Result:")
        let result = ref as! NSDictionary
        result.forEach { key, value in
            print("\(key) : \(value)")
        }
    }
    func addItemAndReturnData() {
        let query = [
          kSecValueData: "abcd1234".data(using: .utf8)!,
          kSecAttrAccount: "admin",
          kSecAttrServer: "google.com",
          kSecClass: kSecClassInternetPassword,
          kSecReturnData: true,
          kSecReturnAttributes: true
        ] as CFDictionary

        var ref: AnyObject?

        let status = SecItemAdd(query, &ref)
        let result = ref as! NSDictionary
        print("Operation finished with status: \(status)")
        print("Username: \(result[kSecAttrAccount] ?? "")")
        let passwordData = result[kSecValueData] as! Data
        let passwordString = String(data: passwordData, encoding: .utf8)
        print("Password: \(passwordString ?? "")")

    }
    func retrievingItems() {
        let query = [
          kSecClass: kSecClassInternetPassword,
          kSecAttrServer: "google.com",
          kSecReturnAttributes: true,
          kSecReturnData: true,
          kSecMatchLimit: 20
        ] as CFDictionary

        var result: AnyObject?
        let status = SecItemCopyMatching(query, &result)

        print("Operation finished with status: \(status)")
        let array = result as! [NSDictionary]

        array.forEach { dic in
          let username = dic[kSecAttrAccount] ?? ""
          let passwordData = dic[kSecValueData] as! Data
          let password = String(data: passwordData, encoding: .utf8)!
          print("Username: \(username)")
          print("Password: \(password)")
        }
    }
    
    func retrievingItem() {
        let query = [
          kSecClass: kSecClassInternetPassword,
          kSecAttrServer: "google.com",
          kSecReturnAttributes: true,
          kSecReturnData: true,
          //kSecMatchLimit: 20
        ] as CFDictionary

        var result: AnyObject?
        let status = SecItemCopyMatching(query, &result)
        
        print("Operation finished with status: \(status)")
        let dic = result as! NSDictionary

        let username = dic[kSecAttrAccount] ?? ""
        let passwordData = dic[kSecValueData] as! Data
        let password = String(data: passwordData, encoding: .utf8)!
        print("Username: \(username)")
        print("Password: \(password)")
    }

    //toàn bộ
    func updateItems() {
        let query = [
          kSecClass: kSecClassInternetPassword,
          kSecAttrServer: "google.com",
        ] as CFDictionary

        let updateFields = [
          kSecValueData: "ahihi".data(using: .utf8)!
        ] as CFDictionary

        let status = SecItemUpdate(query, updateFields)
        print("Operation finished with status: \(status)")
    }
    
    //1 item cụ thể
    func updateItem() {
        let query = [
          kSecClass: kSecClassInternetPassword,
          kSecAttrServer: "google.com",
          kSecAttrAccount: "anhnv2011"
        ] as CFDictionary

        let updateFields = [
          kSecValueData: "anhnv2011".data(using: .utf8)!
        ] as CFDictionary

        let status = SecItemUpdate(query, updateFields)
        print("Operation finished with status: \(status)")
    }
    
    func deleteItems() {
        let query = [
          kSecClass: kSecClassInternetPassword,
          kSecAttrServer: "google.com",
          kSecAttrAccount: "anhnv2011"
        ] as CFDictionary

        SecItemDelete(query)

    }
}

