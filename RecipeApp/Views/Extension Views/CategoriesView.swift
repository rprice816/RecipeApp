//
//  CategoriesView.swift
//  RecipeApp
//
//  Created by russell price on 5/12/23.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        VStack{
            Text("Categories")
                .font(.largeTitle)
                .foregroundColor(.white.opacity(0.85))
                .fontWeight(.medium)
            List{
                ForEach(Category.allCases) { category in
                    NavigationLink( "\(category.rawValue)s", destination: CategoryView(category: category))
                }
                .listRowBackground((Color.white.opacity(0.2)))
                .foregroundColor(.white.opacity(0.85))
                .fontWeight(.medium)
            }
        }
            .scrollContentBackground(.hidden)
            .background(Gradient(colors: [.secondary, .teal]))
        .navigationTitle("")
        .preferredColorScheme(.light)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            CategoriesView()
                .environmentObject(RecipesViewModel())
        }
    }
}
