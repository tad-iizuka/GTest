//
//  ContentView.swift
//  GTest
//
//  Created by Tadashi on 2019/12/20.
//  Copyright © 2019 UBUNIFU Inc. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

struct ContentView: View {

	@ObservedObject var session = FBSession()

    var body: some View {
        VStack {
			if (session.user == nil) {
				Button(action: self.signIn, label: {
					Text("Google Login")
				}).shadow(radius: 4.0)
				.cornerRadius(8.0)
			} else {
				Button(action: self.signOut, label: {
					Text("logout")
				}).shadow(radius: 4.0)
				.cornerRadius(8.0)
			}
        }
        .onAppear(perform: session.listen)
    }

    func signIn() {
		GIDSignIn.sharedInstance()?.restorePreviousSignIn()
		GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
		GIDSignIn.sharedInstance()?.signIn()
    }

	func signOut() {
		try! Auth.auth().signOut()
		GIDSignIn.sharedInstance().signOut()
		GIDSignIn.sharedInstance().disconnect()
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class FBSession: ObservableObject {

	@Published var user: User?

    func listen() {
        _ = Auth.auth().addStateDidChangeListener { (auth, user) in
			self.user = user
        }
    }
}
