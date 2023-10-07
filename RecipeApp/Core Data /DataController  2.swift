//
//  DataController .swift
//  RecipeApp
//
//  Created by russell price on 8/1/23.
//
import CoreData
import Foundation


@MainActor class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "RecipeData")

    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
