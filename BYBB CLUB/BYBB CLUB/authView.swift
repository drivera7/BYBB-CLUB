//
//  authView.swift
//  BYBB CLUB
//
//  Created by Diego Rivera on 11/14/23.
//


import Firebase
import FirebaseAuth

class AuthView: ObservableObject {
    @Published var user: User?

    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            self.user = authResult?.user
        }
    }

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
        
            self.user = authResult?.user
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}

