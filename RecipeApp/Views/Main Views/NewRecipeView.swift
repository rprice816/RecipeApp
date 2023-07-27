//
//  NewRecipeView.swift
//  RecipeApp
//
//  Created by russell price on 5/10/23.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var steps: String = ""
    @State private var image: String = ""
    
    @State private var navigateToRecipe = false
    @EnvironmentObject var recipeVM: RecipesViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Gradient(colors: [.secondary, .teal]))
                .ignoresSafeArea()
            VStack{
                RecipeEditorImage()
                Form{
                    Section(header: Text("Name:")){
                        TextField("", text: $name)
                    }
                    .foregroundColor(.white.opacity(0.85))
                    .listRowBackground((Color.white.opacity(0.2)))
                    Section(header: Text("Category:")){
                        Picker("Category:", selection: $selectedCategory) {
                            ForEach(Category.allCases) { category in
                                Text(category.rawValue)
                                    .tag(category)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    .accentColor(.white)
                    .foregroundColor(.white.opacity(0.85))
                    .labelsHidden()
                    .listRowBackground((Color.white.opacity(0.2)))
                    Section(header: Text("Description:")){
                        TextEditor( text: $description)
                    }
                    .foregroundColor(.white.opacity(0.85))
                    .listRowBackground((Color.white.opacity(0.2)))
                    Section(header: Text("Ingredients:")){
                        TextEditor( text: $ingredients)
                    }
                    .foregroundColor(.white.opacity(0.85))
                    .listRowBackground((Color.white.opacity(0.2)))
                    Section(header: Text("Steps:")){
                        TextEditor( text: $steps)
                    }
                    .foregroundColor(.white.opacity(0.85))
                    .listRowBackground((Color.white.opacity(0.2)))
                }
                
                .scrollContentBackground(.hidden)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    dismiss()
                } label: {
                    Label("Cancel", systemImage: "xmark")
                        .labelStyle(.iconOnly)
                }
                .foregroundColor(.red.opacity(0.8))
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(isActive: $navigateToRecipe) {
                    HomeScreenView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Button{
                        saveRecipe()
                        navigateToRecipe = true
                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                }
                .disabled(name.isEmpty)
                .accentColor(.green)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
        .preferredColorScheme(.light)
    }
    }


struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            NewRecipeView()
                .environmentObject(RecipesViewModel())
        }
    }
}

extension NewRecipeView {
    private func saveRecipe() {
        let recipe = Recipe(name: name, image: "", description: description, ingredients: ingredients, directions: steps, category: selectedCategory.rawValue, url: "")
        recipeVM.addRecipe(recipe: recipe)
    }
}
