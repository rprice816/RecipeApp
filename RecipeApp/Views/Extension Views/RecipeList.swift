//
//  RecipeList.swift
//  RecipeApp
//
//  Created by russell price on 5/12/23.
//

import SwiftUI

struct RecipeList: View {
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name)]) var recipes: FetchedResults<RecipeEntry>
    @Environment(\.managedObjectContext) var moc

    @State var text = ""

    public var gridItemLayout = [
        GridItem(.flexible(minimum: 100, maximum: 100), spacing:20),
        GridItem(.flexible(minimum: 100, maximum: 100), spacing:20),
        GridItem(.flexible(minimum: 100, maximum: 100))]
    var body: some View {
        VStack{
            SearchBar(text: $text)
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 12, content: {
                    Section(header: Text("")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.secondaryColor1.opacity(0.85))){
                            ForEach(recipes.filter({ "\($0)".contains(text) || text.isEmpty})){ recipe in
                                NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                                    RecipeCard(recipe: recipe)
                                }
                                .padding()
                            }
                        }
                    })
                }
            }
        }
    }

