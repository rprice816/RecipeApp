//
//  RecipeAppApp.swift
//  RecipeApp
//
//  Created by russell price on 5/4/23.
//

import SwiftUI
import FirebaseCore
import CoreData
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
@main 
struct RecipeAppApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var dataController = DataController()
    
  var body: some Scene {
      WindowGroup {
          NavigationView{
              EmailLoginView()
                  .environment(\.managedObjectContext, dataController.container.viewContext)
                
          }
      }
  }
}
