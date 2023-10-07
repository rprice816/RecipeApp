//
//  NewRecipeView.swift
//  RecipeApp
//
//  Created by russell price on 5/10/23.
//
import SwiftUI

struct NewRecipeView: View {
    @Environment(\.managedObjectContext) var moc

  
    @State private var name: String = ""
    @State private var category: String = ""
    @State private var descriptionRecipe: String = ""
    @State private var ingredients: String = ""
    @State private var steps: String = ""
    @State private var image: String = ""
    @State private var review:String = ""
    @State private var rating = 3

    @Environment(\.dismiss) private var dismiss
    let categories = [ "Main","Appetizer", "Side","Dessert","Snack", "Drink"]
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    var body: some View {
            ZStack {
                Rectangle()
                    .fill(Gradient(colors: [.primaryColor2, .primaryColor1]))
                    .ignoresSafeArea()
                VStack{
                        ZStack (alignment: .center){
                            VStack{
                                if let inputImage = inputImage {
                                    Image(uiImage: inputImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width:300, height: 250)
                                        .cornerRadius(10)
                                    
                                } else{
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:50, height: 50, alignment: .center)
                                        .foregroundColor(.secondaryColor1.opacity(0.85))
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .frame(width: 300, height: 250)
                                        .background(Color.secondaryColor1.opacity(0.2))
                                        .cornerRadius(10)
                                }
                                Image(systemName:("plus.circle.fill"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(.secondaryColor1.opacity(0.85))
                                    .frame(width:35, height:7)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        showingImagePicker = true
                                    }
                                }
                            }
                    Form{
                        Section(header: Text("Name:")){
                            TextField("", text: $name)
                        }
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                        Section(header: Text("Category:")){
                            Picker("Category:", selection: $category) {
                                Text("Category").tag("")
                                ForEach(categories, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                        .accentColor(.secondaryColor1)
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .labelsHidden()
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                        Section(header: Text("Description:")){
                            TextEditor( text: $descriptionRecipe)
                        }
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                        Section(header: Text("Ingredients:")){
                            TextEditor( text: $ingredients)
                        }
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                        Section(header: Text("Steps:")){
                            TextEditor( text: $steps)
                        }
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                        Section {
                            TextEditor(text: $review)
                            RatingView(rating: $rating)
                        } header: {
                            Text("Write a review")
                        }
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                    }
                    .scrollContentBackground(.hidden)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                            dismiss()
                        } label: {
                            Label("Cancel", systemImage: "xmark")
                                .labelStyle(.iconOnly)
                        }
                        .tint(.red.opacity(0.85))
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            let newRecipe = Recipe(context: moc)
                            newRecipe.id = UUID()
                            newRecipe.category = category
                            newRecipe.name = name
                            newRecipe.descriptionRecipe = descriptionRecipe
                            newRecipe.ingredients = ingredients
                            newRecipe.steps = steps
                            newRecipe.rating = Int16(rating)
                            newRecipe.review = review
                            
                            try? moc.save()
                            dismiss()
                        } label: {
                            Label("Done", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                        .disabled(name.isEmpty)
                        .tint(.green.opacity(0.85))
                    }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
        .preferredColorScheme(.light)
        .navigationBarBackButtonHidden(true)
    }
    }



