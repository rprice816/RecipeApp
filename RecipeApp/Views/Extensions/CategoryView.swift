//
//  CategoryView.swift
//  RecipeApp
//
//  Created by russell price on 5/12/23.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    @EnvironmentObject var recipeVM: RecipesViewModel
    var recipes: [Recipe] {
        return recipeVM.recipes.filter{ $0.category == category.rawValue}
    }
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Gradient(colors: [.secondary, .teal]))
                .ignoresSafeArea()
            VStack{
                Text("\(category.rawValue)s")
                    .font(.largeTitle)
                    .foregroundColor(.white.opacity(0.85))
                    .fontWeight(.medium)
                ScrollView {
                    RecipeList(recipes: recipes)
                }
            }
        }
            .preferredColorScheme(.light)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            CategoryView(category: Category.main)
                .environmentObject(RecipesViewModel())
        }
    }
}
