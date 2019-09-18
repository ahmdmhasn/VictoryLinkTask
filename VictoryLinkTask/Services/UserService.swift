//
//  UserService.swift
//  VictoryLinkTask
//
//  Created by Ahmed M. Hassan on 9/18/19.
//  Copyright © 2019 Ahmed M. Hassan. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

let DB_BASE = Database.database().reference()

enum UserNodes: String {
    case firstName = "first_name"
    case lastName = "last_name"
    case phoneNumber = "phone_number"
    case email
}

protocol UserServiceProtocol: class {
    func loginUser(email: String, password: String, completion: @escaping userResponse)
    func updateUser(_ type: UserNodes, value: String)
    func getUser(_ type: UserNodes, completion: @escaping (String)->())
}

class UserService: UserServiceProtocol {
    
    var USERS_REF: DatabaseReference {
        return DB_BASE.child("users")
    }
    
    var userProfileReference: DatabaseReference {
        let userID = Auth.auth().currentUser?.uid
        return USERS_REF.child(userID ?? "").child("profile")
    }
    
    func updateUser(_ type: UserNodes, value: String) {
        userProfileReference.child(type.rawValue).setValue(value)
    }
    
    func getUser(_ type: UserNodes, completion: @escaping (String)->()) {
        userProfileReference.child(type.rawValue).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let value = snapshot.value as? String else { return }
            completion(value)
        })
    }
    
    func loginUser(email: String, password: String, completion: @escaping (String?, Error?)->()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            completion(user?.user.uid, error)
        }
    }
    
}
