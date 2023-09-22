//
//  CategoryView.swift
//  RecipeApp
//
//  Created by russell price on 5/12/23.
//

import SwiftUI

struct CategoryView: View {
    let recipe: Recipe
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Gradient(colors: [.secondary, .teal]))
                .ignoresSafeArea()
            VStack{
                Text(recipe.category ?? "Category")
                    .font(.largeTitle)
                    .foregroundColor(.white.opacity(0.85))
                    .fontWeight(.medium)
                ScrollView {
                    RecipeList()
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    dismiss()
                } label: {
                    Label("Cancel", systemImage: "arrow.uturn.backward.circle.fill")
                        .labelStyle(.iconOnly)
                }
                .foregroundColor(.white.opacity(0.8))
            }
        }
        .navigationBarBackButtonHidden(true)
            .preferredColorScheme(.light)
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
    }
}


