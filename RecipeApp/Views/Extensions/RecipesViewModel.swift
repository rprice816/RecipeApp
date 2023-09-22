//
//  RecipesViewModel.swift
//  RecipeApp
//
//  Created by russell price on 5/13/23.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []

    init() {
        recipes = Recipe.all
    }
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
}



