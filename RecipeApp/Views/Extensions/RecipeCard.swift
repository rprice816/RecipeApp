//
//  RecipeCard.swift
//  RecipeApp
//
//  Created by russell price on 5/11/23.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    @EnvironmentObject var recipeVM: RecipesViewModel
    var body: some View {
        VStack(alignment: .center){
            AsyncImage(url: URL(string: recipe.image))
            { image in image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        placeholder: { Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width:50, height: 50, alignment: .center)
                .foregroundColor(.white.opacity(0.85))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: 100, height: 100)
        .background(Color.secondary.opacity(0.85))
        .cornerRadius(10)
            Text("\(recipe.name) \n")
                .lineLimit(2)
                    .foregroundColor(Color.white.opacity(0.85))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
        }
    }
}
struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: Recipe.all[0])
            .environmentObject(RecipesViewModel())
    }
}   
