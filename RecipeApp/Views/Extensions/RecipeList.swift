//
//  RecipeList.swift
//  RecipeApp
//
//  Created by russell price on 5/12/23.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]
    @State var searchQuery = ""
    public var gridItemLayout = [
        GridItem(.flexible(minimum: 100, maximum: 100), spacing:20),
        GridItem(.flexible(minimum: 100, maximum: 100), spacing:20),
        GridItem(.flexible(minimum: 100, maximum: 100))]
    var body: some View {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 12, content: {
                    Section(header: Text("")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.white.opacity(0.85))){
                            ForEach(recipes){ recipe in
                                NavigationLink( destination: RecipeDetailsView(recipe: recipe)) {
                                    RecipeCard(recipe: recipe)
                                }
                                .padding()}
                        }
                })
        }
        
    }
    }
struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            RecipeList(recipes: Recipe.all)
                .environmentObject(RecipesViewModel())
        }

    }
}
