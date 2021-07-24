//
//  SignInWhithAppleButtonCustom.swift
//  TalentApp
//
//  Created by Emanuele Villani on 01/05/2021.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWhithAppleButtonCustom: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        return ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
    }
    
    func updateUIView(_ uiView: UIViewType,context: Context) {}
}
