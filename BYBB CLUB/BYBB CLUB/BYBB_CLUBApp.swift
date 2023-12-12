//
//  BYBB_CLUBApp.swift
//  BYBB CLUB
//
//  Created by Diego Rivera on 11/14/23.
//

import SwiftUI

import SwiftUI
import FirebaseCore
import Firebase
import SwiftUICharts

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    Firestore.firestore()
    return true
  }
}




@main
struct BYBB_CLUBApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var manager = HealthManager()
    @StateObject var authView = AuthView()
    var body: some Scene {
        WindowGroup {
            BybbTabView()
                .environmentObject(manager)
                .environmentObject(authView)
        }
    }
}
