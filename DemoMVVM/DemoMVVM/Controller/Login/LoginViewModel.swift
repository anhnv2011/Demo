//
//  LoginViewModel.swift
//  DemoMVVM
//
//  Created by MAC on 8/4/22.
//

import Foundation

final class LoginViewModel{
    // MARK: - enum
    enum LoginResult {
        case success
        case failure(Bool, String)
    }
    
    // MARK: - Properties
    var email: String = ""
    var password: String = ""
//    init(email: String, password: String) {
//        self.email = email
//        self.password = password
//    }
    // MARK: - Actions
    func login(email: String, password: String, completion: (Bool) -> ()) {
        if email == "" || password == "" {
            completion(false)
        } else {
            completion(true)
        }
    }
    
    
    // MARK: - typealias
        typealias Completion = (LoginResult) -> Void
    func login2(email: String, password: String, completion: Completion) {
           if email == "" || password == "" {
               //callback
               completion(.failure(true, "Mật khẩu hoặc email rỗng."))
           } else {
               //cập nhật dữ liệu
               self.email = ""
               self.password = ""
               
               //callback
               completion(.success)
           }
       }
}
