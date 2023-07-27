//
//  RecipeAppApp.swift
//  RecipeApp
//
//  Created by russell price on 5/4/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
@main 
struct RecipeAppApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @EnvironmentObject var recipeVM: RecipesViewModel
    @StateObject var recipeViewModel = RecipesViewModel()
  var body: some Scene {
    WindowGroup {
      NavigationView {
        LoginScreen()
              .environmentObject(recipeViewModel)
      }
    }
  }
}
