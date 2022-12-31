//
//  ViewController.swift
//  Demo Keychain
//
//  Created by MAC on 8/23/22.
//

import UIKit
import Security
import SwiftKeychainWrapper
class ViewController: UIViewController {
    func encode<T: Codable>(object: T) -> Data? {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
//            print(try encoder.encode(object))
            return try encoder.encode(object)
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }

    func decode<T: Decodable>(json: Data, as clazz: T.Type) -> T? {
        do {
            let decoder = JSONDecoder()
            let data = try decoder.decode(T.self, from: json)
            
            return data
        } catch {
            print("An error occurred while parsing JSON")
        }
        
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        addItem()
//        addItemAndStatus()
//        addItemAndReturnAtributes()
//        addItemAndReturnData()
//        retrievingItems()
//        retrievingItem()
//        updateItems()
//        updateItem()
        
    
//        save()
//
//        removePass()
//        getpass()

//        saveUser()

       
//        creat()
//        deleteall()
//        getall()
//        getone()
        
//        let sessionid = "e93545ffb948fff28596f7fa8958749ec1a7e05f"
//        let saveSuccessful: Bool = KeychainWrapper.standard.set(sessionid, forKey: "sessionID")
//
//        let retrievedString: String? = KeychainWrapper.standard.string(forKey: "sessionID")
//        print(retrievedString)
//
//        let removeSuccessful: Bool = KeychainWrapper.standard.removeObject(forKey: "sessionID")
//        let retrievedString2: String? = KeychainWrapper.standard.string(forKey: "sessionID")
//        print(retrievedString2)
        
        
        let saveSuccessful: Bool = KeychainWrapper.standard.set("Some String", forKey: "myKey")

        print(saveSuccessful)
        let retrievedString: String? = KeychainWrapper.standard.string(forKey: "myKey")
        print(retrievedString!)
//        let removeSuccessful: Bool = KeychainWrapper.standard.removeObject(forKey: "myKey")


    }

    func creat(){
        let user = User(username:"12312312", password:"212222", sessionID:"qweqweacxc", profileID: "12312312312312")
        KeyChainManager.addItem(user)
    }
    func getall(){
        do {
            let a = try KeyChainManager.getAllItems()
            print(a)
        } catch {
            print(error)
        }
        
        
    }
    func getone(){
        let user = User(username:"qweqweqwe", password:"212222", sessionID:"qweqweacxc", profileID: "12312312312312")
        let data = encode(object: user)
        
    }
    func update(){
        
    }
    
    func deleteall(){
        KeyChainManager.deleteAllItemsQuery()
    }
    func delete(){
        let user = User(username:"qweqweqwe", password:"212222", sessionID:"qweqweacxc", profileID: "12312312312312")
        
    }
    
    func saveUser(){
        let user = User(username:"anhnv2011", password:"123455", sessionID:"qweqweacxc", profileID: "0000324")
//        KeyChainManager.addItem(user)
//        do {
//            try KeyChainManager.saveUser(service: "tmdb", account: "anhnv2011", user: user)
//        } catch {
//            print(error)
//        }
        let encodedUser = encode(object: user)
        print(encodedUser as Any)
        let a = decode(json: encodedUser!, as: User.self)
        print(a as Any)
        KeychainWrapper.standard.set(encodedUser!, forKey: "uservalue")
        let value = KeychainWrapper.standard.data(forKey: "uservalue")
        _ = decode(json: value!, as: User.self)
    
        
        
//        KeychainWrapper.standard.set(encodedUser!, forKey: "user")
//        let retrievedString: String? = KeychainWrapper.standard.string(forKey: "user")
//        print(retrievedString)
//
//        let data = retrievedString!.data(using: .utf8)!
//        do {
//            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
//            {
//               print(jsonArray) // use the json here
//            } else {
//                print("bad json")
//            }
//        } catch let error as NSError {
//            print(error)
//        }
        
    }
    
    func save(){
        do {
            
            let user = User(username:"sdf", password:"sdfsdf", sessionID:"qweqweacxc", profileID: "0000324")
            let data = encode(object: user)
            try KeyChainManager.save(service: "googasdadle1.com.vn",
                                     account: "anhnvadasdasd",
                                     password: data!
                                    )
        } catch  {
            print(error)
        }
    }
    func getpass(){
        guard let data = KeyChainManager.getpass(service: "googasdadle1.com.vn"
                                        ) else {
            print("failed to get pass")
            return
        }
        let password = decode(json: data, as: User.self)
        print(password)
       
        
    }

    func removePass(){
        KeyChainManager.removepass(service: "googasdadle1.com.vn")
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
            kSecAttrServer: "google.com",
            kSecClass: kSecClassInternetPassword

        ] as CFDictionary

        let status = SecItemAdd(query, nil)
        print("Status: \(status)")
    }

    func addItemAndReturnAtributes() {

        let query = [
            kSecValueData: "anhnv_keychainádaq".data(using: .utf8)!,
            kSecAttrAccount: "anhnv2011",
            kSecAttrServer: "google.com",
            kSecClass: kSecClassInternetPassword,
            kSecReturnAttributes: true
        ] as CFDictionary

        var ref: AnyObject?

        let status = SecItemAdd(query, &ref)
        print("Status: \(status)")
        print("Result:")
        let result = ref as? NSDictionary
        result?.forEach { key, value in
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

//    //toàn bộ
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

