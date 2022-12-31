//
//  KeychainManager.swift
//  Demo Keychain
//
//  Created by MAC on 10/7/22.
//

import Foundation
import UIKit
import Security
struct User: Codable {
    let username: String
    let password: String
    let sessionID: String
    let profileID: String
}
enum KeyChainError: Error {
    case duplicateEntry
    case unknown(OSStatus)
}
class KeyChainManager {
    static func convertItemToJson<O: Encodable>(_ item: O) -> Data {
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(item)
        return jsonData
    }
    static func decodeFromJson(_ itemData: Data) -> User? {
        let jsonDecoder = JSONDecoder()
        let decodedObject = try? jsonDecoder.decode(User.self, from: itemData)
        return decodedObject
    }
//
//
//
//
    //creat
    static func addItemsQuery(for item: User) -> [String: Any] {
        return [kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: String(data: convertItemToJson(item), encoding: .utf8)!,
                kSecReturnPersistentRef as String: kCFBooleanTrue as Any,
                kSecValueData as String: convertItemToJson(item)]
    }
    static func addItem(_ item: User)  {
        var persistentRef: AnyObject?
        let status = SecItemAdd(addItemsQuery(for: item) as CFDictionary, &persistentRef)

        guard status == errSecSuccess else {
//            throw fatalError("stopping code execution due to errorStatus: \(status)")
            return
        }

        if (persistentRef as? Data) != nil {
            print("Store your persistenceReference somewhere")
        }
    }


    //read
    static func getAllItemsQuery() -> [String: Any] {
        return [kSecClass as String: kSecClassGenericPassword,
                kSecMatchLimit as String: kSecMatchLimitAll,
                kSecReturnPersistentRef as String: kCFBooleanTrue as Any,
                kSecReturnData as String: kCFBooleanTrue as Any]
    }

    static func getAllItems() throws -> [User] {

        var item_list: AnyObject?
        let status = SecItemCopyMatching(getAllItemsQuery() as CFDictionary, &item_list)

        if status == errSecItemNotFound {
            return []
        }
        guard status == errSecSuccess , let returnedItems = item_list as? [NSDictionary] else {
            throw KeyChainError.unknown(status)
        }

        var object_list = [User]()
        for item in returnedItems {
            if let jsonData = item[kSecValueData] as? Data {
                if let decodedObject = decodeFromJson(jsonData) {
                    if (item[kSecValuePersistentRef] as? Data) != nil {
                        object_list.append(decodedObject)
                    }
                }
            }
        }
        return object_list
    }
    static func getItemByRef(with ref: NSData) -> [String: Any] {
        return [kSecClass as String: kSecClassGenericPassword,
                kSecValuePersistentRef as String: ref,
                kSecMatchLimit as String: kSecMatchLimitOne,
                kSecReturnData as String: kCFBooleanTrue as Any,
                kSecReturnPersistentRef as String: kCFBooleanTrue as Any]
    }
//
    static func findItem(by ref: NSData) -> User? {

        let query = getItemByRef(with: ref) as CFDictionary

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query, &item)

        if status == errSecItemNotFound {
                    return nil
                }
        let foundItem = item as? [String: Any]
        let jsonData = foundItem![kSecValueData as String] as? Data
//        guard status == errSecSuccess, let foundItem = item as? [String: Any],
//            let jsonData = foundItem[kSecValueData as String] as? Data else {
//                throw fatalError("stopping code execution")
////            return
//        }
//

        return decodeFromJson(jsonData!)
    }

//    Update
    static func getSpecificItemQuery(for ref: NSData) -> [String: Any] {
        return [kSecClass as String: kSecClassGenericPassword,
                kSecValuePersistentRef as String: ref]
    }

    class func updateItem(_ ref: NSData, with updatedItem: User) throws {
        let query = getSpecificItemQuery(for: ref) as CFDictionary

        let updateRequest = [kSecValueData: convertItemToJson(updatedItem)] as CFDictionary
        let status = SecItemUpdate(query, updateRequest)

        guard status == errSecSuccess else {
            throw KeyChainError.unknown(status)
        }
    }

//    Delete
    static func deleteItem(_ ref: NSData) throws {
        let status = SecItemDelete(getSpecificItemQuery(for: ref) as CFDictionary)
        guard status == errSecSuccess else {
            throw KeyChainError.unknown(status)
        }
    }
    static func deleteAllItemsQuery() -> [String: Any] {
        return [kSecClass as String: kSecClassGenericPassword]
    }


    
    
    
    
    static func saveUser(
        service: String,
        account: String,
        user: User
       
    ) throws {
        
        print(String(data: convertItemToJson(user), encoding:.utf8 ) as Any)
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword ,
            kSecAttrService as String: service as Any,
            kSecAttrAccount as String: account as Any,
            kSecValueData as String: String(data: convertItemToJson(user), encoding:.utf8)!,
//            kSecValueData as String: sessionid as AnyObject,
//            kSecValueData as String: profileId as AnyObject
//
    
            
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status != errSecDuplicateItem else {
            throw KeyChainError.duplicateEntry
        }
        guard status == errSecSuccess else {
            throw KeyChainError.unknown(status)
            
        }
        
        print("Saved")
    }
    static func save(
        service: String,
        account: String,
        password: Data
       
    ) throws {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword ,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: password as AnyObject

        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status != errSecDuplicateItem else {
            throw KeyChainError.duplicateEntry
        }
        guard status == errSecSuccess else {
            throw KeyChainError.unknown(status)
            
        }
        
        print("Saved")
    }
    
    static func getpass (
        service: String
//        account: String
    
    ) -> Data? {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword ,
            kSecAttrService as String: service as AnyObject,
//            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String : kCFBooleanTrue,
            kSecMatchLimit as String : kSecMatchLimitOne
        
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(
            query as CFDictionary,
            &result)
       
        print("Read status: \(status)")
        
        return result as? Data
    
        
    }
    
    static func  removepass( service: String) {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword ,
            kSecAttrService as String: service as AnyObject,
//            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String : kCFBooleanTrue,
            kSecMatchLimit as String : kSecMatchLimitOne
        
        ]
        SecItemDelete(query as CFDictionary)
        print(SecItemDelete(query as CFDictionary)
)
    }
    
}
