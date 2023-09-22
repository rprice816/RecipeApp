//
//  RecipeDetailsView.swift
//  RecipeApp
//
//  Created by russell price on 5/8/23.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipe: RecipeEntry
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    @Environment(\.managedObjectContext) var moc

    var body: some View {
            ZStack{
                Rectangle()
                    .fill(Gradient(colors: [.primaryColor2, .primaryColor1]))
                    .ignoresSafeArea()
                ScrollView{
                    VStack(alignment: .center){
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width:50, height: 50, alignment: .center)
                            .foregroundColor(.secondaryColor1.opacity(0.85))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(width: 300, height: 250)
                    .background(Color.secondaryColor1.opacity(0.2))
                    .cornerRadius(10)
                    .padding()
                    Text(recipe.name ?? "")
                        .foregroundColor(Color.secondaryColor1.opacity(0.85))
                        .fontWeight(.semibold)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding()
                    VStack(alignment: .leading){
                        Text("Description:")
                            .bold()
                            .foregroundColor(Color.secondaryColor1.opacity(0.85))
                        Text(recipe.descriptionRecipe ?? "")
                            .padding()
                            .frame(width: 300)
                            .frame(alignment: .leading)
                            .background(Color.secondaryColor1.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(Color.secondaryColor1.opacity(0.8))
                            .fontWeight(.medium)
                        Text("Ingredients:")
                            .bold()
                            .foregroundColor(Color.secondaryColor1.opacity(0.85))
                        Text(recipe.ingredients ?? "")
                            .padding()
                            .frame(width: 300)
                            .frame(alignment: .leading)
                            .background(Color.secondaryColor1.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(Color.secondaryColor1.opacity(0.8))
                            .fontWeight(.medium)
                        Text("Steps:")
                            .bold()
                            .foregroundColor(Color.secondaryColor1.opacity(0.85))
                        Text(recipe.steps ?? "")
                            .padding()
                            .frame(width: 300)
                            .frame(alignment: .leading)
                            .background(Color.secondaryColor1.opacity(0.2))
                            .cornerRadius(10)
                            .foregroundColor(Color.secondaryColor1.opacity(0.8))
                            .fontWeight(.medium)
                        RatingView(rating: .constant(Int(recipe.rating)))
                            .font(.largeTitle)
                            .padding()
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
        .preferredColorScheme(.light)
        .alert("Delete recipe?", isPresented: $showingDeleteAlert) {
            Button {
                   deleteRecipe()
                       } label: {
                           Text("Delete")
                       }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button{
                    dismiss()
                } label: {
                    Label("Cancel", systemImage: "arrow.uturn.backward.circle.fill")
                        .labelStyle(.iconOnly)
                }
                .tint(.secondaryColor1.opacity(0.8))
            }
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this recipe", systemImage: "trash")
                    .foregroundColor(.secondaryColor1.opacity(0.85))
            }
        }
    }
    func deleteRecipe() {
        moc.delete(recipe)
        
        try? moc.save()
        dismiss()
    }
}

