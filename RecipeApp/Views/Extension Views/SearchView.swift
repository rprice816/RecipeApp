//
//  SearchView.swift
//  RecipeApp
//
//  Created by russell price on 5/18/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var recipeVM: RecipesViewModel
    @State var searchQuery = ""
    @State var filteredRecipes = RecipesViewModel().recipes
    var body: some View {
                List {
                  ForEach(filteredRecipes) { recipe in
                    NavigationLink("\(recipe.name)", destination: RecipeDetailsView(recipe: recipe))
                  }
                  .listRowBackground((Color.white.opacity(0.2)))
                  .foregroundColor(.white.opacity(0.85))
                  .fontWeight(.medium)
                }
                .searchable(text: $searchQuery, placement: .toolbar, prompt: "Search By Recipe Name")
                .onSubmit(of: .search) {
                  filterRecipes()
                }
                .scrollContentBackground(.hidden)
                .background(Gradient(colors: [.secondary, .teal]))
                .navigationTitle("")
            }
    func filterRecipes() {
      if searchQuery.isEmpty {
        // 1
        filteredRecipes = RecipesViewModel().recipes
      } else {
        // 2
        filteredRecipes = RecipesViewModel().recipes.filter {
          $0.name
            .localizedCaseInsensitiveContains(searchQuery)
        }
      }
    }
        }


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SearchView()
        }
    }
}
