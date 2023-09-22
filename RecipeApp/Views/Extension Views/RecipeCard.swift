//
//  RecipeCard.swift
//  RecipeApp
//
//  Created by russell price on 5/11/23.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: Recipe


    var body: some View {
        VStack{
            VStack(alignment: .center){
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:50, height: 50, alignment: .center)
                    .foregroundColor(.secondaryColor1.opacity(0.85))
            }
            .frame(width: 100, height: 100)
            .background(Color.secondary.opacity(0.85))
            .cornerRadius(10)
            VStack{
                Text(recipe.name ?? "")
                    .lineLimit(2)
                    .foregroundColor(Color.secondaryColor1.opacity(0.85))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
        }
    }
    }
