//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by russell price on 5/11/23.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case main = "Main"
    case side = "Side"
    case appetizer = "Appetizer"
    case salad = "Salad"
    case soup = "Soup"
    case snack = "Snack"
    case dessert = "Dessert"
    case drink = "Drink"
}
struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue
    let url: String
}
extension Recipe{
    static let all: [Recipe] = [
    Recipe(
        name: "Example Card", image: "", description: "Yummy", ingredients: "steak, butter, salt, onions, mushrooms", directions: "cook", category: "Main", url: ""
    )
    ]
}
