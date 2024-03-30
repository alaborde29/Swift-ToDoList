//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Alexandre Laborde on 15/03/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                self?.errorMessage = "User already existing"
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id:String) {
        let db = Firestore.firestore()
        let newUser = User(id: id, name: fullName, email: email, joined: Date().timeIntervalSince1970)
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !fullName.trimmingCharacters(in: .whitespaces).isEmpty  else {
            
            errorMessage = "Please fill in all fields."
            return false
        }
        guard NSPredicate(format: "SELF MATCHES %@", #"^[\w-\.]+@([\w-]+\.)+[\w-]{2,30}$"#)
            .evaluate(with: email) else {
            
            errorMessage = "Invalid email format."
            return false
        }
        
        guard NSPredicate(format: "SELF MATCHES %@", #"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$"#)
            .evaluate(with: password) else {
            
            errorMessage = "Password must have a minimum of 8 characters, a special character, a uppercase and a number."
            return false
        }
        return true
    }
}

