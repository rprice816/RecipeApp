//
//  RecipeDetailsView.swift
//  RecipeApp
//
//  Created by russell price on 5/8/23.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe: Recipe
    @EnvironmentObject var recipeVM: RecipesViewModel
    var body: some View {
        ZStack{
        Rectangle()
            .fill(Gradient(colors: [.secondary, .teal]))
            .ignoresSafeArea()
        ScrollView{
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
            .frame(width: 300, height: 250)
            .background(Color.white.opacity(0.2))
            .cornerRadius(10)
            .padding()
                Text("\(recipe.name)")
                    .foregroundColor(Color.white.opacity(0.85))
                    .fontWeight(.semibold)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            }
                VStack(alignment: .leading){
                    Text("Description:")
                        .bold()
                        .foregroundColor(Color.white.opacity(0.85))
                    Text("\(recipe.description)")
                        .padding()
                        .frame(width: 300)
                        .frame(alignment: .leading)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(Color.white.opacity(0.8))
                        .fontWeight(.medium)
                    Text("Ingredients:")
                        .bold()
                        .foregroundColor(Color.white.opacity(0.85))
                    Text("\(recipe.ingredients)")
                        .padding()
                        .frame(width: 300)
                        .frame(alignment: .leading)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(Color.white.opacity(0.8))
                        .fontWeight(.medium)
                    Text("Steps:")
                        .bold()
                        .foregroundColor(Color.white.opacity(0.85))
                    Text("\(recipe.directions)")
                        .padding()
                        .frame(width: 300)
                        .frame(alignment: .leading)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                        .foregroundColor(Color.white.opacity(0.8))
                        .fontWeight(.medium)
                }
            }
            }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
        .preferredColorScheme(.light)
        }
    }
struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            RecipeDetailsView(recipe: Recipe.all[0])
        }
    }
}
