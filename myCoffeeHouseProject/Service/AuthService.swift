//
//  AuthService.swift
//  myCoffeeHouseProject
//
//  Created by Nurtilek on 4/19/24.
//

import UIKit
import FirebaseAuth

struct AuthService {
    
    func sendSmsCode(with phoneNumber: String, completion: @escaping (Result<Void, Error>) -> Void) {
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    completion(.failure(error))
                }
                if let verificationID {
                    UserDefaults.standard.set(verificationID, forKey: "authVericationID")
                    completion(.success(()))
                }
            }
    }
    
    func signIn(with verificationCode: String,  completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        let verificationID = UserDefaults.standard.string(forKey: "authVericationID") ?? ""
        let credetials = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: verificationCode
        )
        
        Auth.auth().signIn(with: credetials) { authResult, error in
            if let error = error {
                completion(.failure(error))
            }
            if let authResult {
                completion(.success(authResult))
            }
        }
    }
}
