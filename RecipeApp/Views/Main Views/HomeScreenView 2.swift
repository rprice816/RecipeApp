//
//  HomeScreenView.swift
//  RecipeApp
//
//  Created by russell price on 5/5/23.
//

import SwiftUI
import Firebase

struct HomeScreenView: View {
    @Environment(\.managedObjectContext) var moc

    var body: some View {
            ZStack {
                Rectangle()
                    .fill(Gradient(colors: [.primaryColor2, .primaryColor1]))
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Text("")
                            .padding(.trailing)
                        Spacer()
                        Text("My Recipes")
                            .font(.largeTitle)
                            .fontWeight(.medium)
                            .foregroundColor(.secondaryColor1.opacity(0.85))
                            .padding(.leading)
                        Spacer()
                        NavigationLink(destination: Sidebar()) {
                            Label("", systemImage: "slider.horizontal.3")
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundColor(.secondaryColor1.opacity(0.8))
                        }
                    }
                    RecipeList()
                    NavigationLink(destination: NewRecipeView()) {
                        Label("Add New Recipe", systemImage: "plus.circle.fill")
                            .foregroundColor(.secondaryColor1.opacity(0.85))
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    .padding()
                }
        }
             .preferredColorScheme(.light)
             .navigationBarTitleDisplayMode(.inline)
             .navigationTitle("")
             .navigationBarBackButtonHidden(true)
         }
     }

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomeScreenView()
            }
        }
}
