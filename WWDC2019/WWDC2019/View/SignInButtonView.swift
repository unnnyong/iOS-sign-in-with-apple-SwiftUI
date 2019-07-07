//
//  SignInButtonView.swift
//  WWDC2019
//
//  Created by Eunyeong Kim on 2019/07/06.
//  Copyright © 2019 Eunyeong Kim. All rights reserved.
//

import SwiftUI
import UIKit
import AuthenticationServices

struct SignInButtonView: UIViewRepresentable {

    typealias UIViewType = ASAuthorizationAppleIDButton

    let completion: () -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(self, completion: completion)
    }

    func makeUIView(context: UIViewRepresentableContext<SignInButtonView>) -> ASAuthorizationAppleIDButton {
        let signInButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default,
                                                        authorizationButtonStyle: DarkModeManager.isDarkMode ? .black : .white)

        signInButton.addTarget(context.coordinator,
                               action: #selector(Coordinator.signInWithApple),
                               for: .touchUpInside)

        return signInButton
    }

    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: UIViewRepresentableContext<SignInButtonView>) {}

    class Coordinator: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

        let signInButton: SignInButtonView
        let completion: () -> Void
        
        init(_ signInButton: SignInButtonView, completion: @escaping () -> Void) {
            self.signInButton = signInButton
            self.completion = completion
        }

        @objc func signInWithApple() {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.email, .fullName]

            let appleIDAuthorizationController = ASAuthorizationController(authorizationRequests: [request])
            appleIDAuthorizationController.delegate = self
            appleIDAuthorizationController.presentationContextProvider = self
            appleIDAuthorizationController.performRequests()
        }

        func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
            guard let appleID = authorization.credential as? ASAuthorizationAppleIDCredential else {
                return
            }

            print("ログイン成功！")
            print(appleID.email)

            completion()
        }

        func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
            return UIWindow()
        }

    }

}
