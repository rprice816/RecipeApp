//
//  HomeScreenView.swift
//  RecipeApp
//
//  Created by russell price on 5/5/23.
//

import SwiftUI
import Firebase
struct HomeScreenView: View {
    @State private var isSidebarOpened = false
    @EnvironmentObject var recipeVM: RecipesViewModel
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Gradient(colors: [.secondary, .teal]))
                .ignoresSafeArea()
            VStack{
                Text("My Recipes")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.white.opacity(0.85))
                RecipeList(recipes: recipeVM.recipes)
            }
            Sidebar(isSidebarVisible: $isSidebarOpened )
        }
        .toolbarBackground(
            Color.secondary.opacity(0.4),
            for: .navigationBar)
        .foregroundColor(.white.opacity(0.85))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button {
                    isSidebarOpened.toggle()
                } label: {
                    Label("Toggle SideBar",
                          systemImage: "slider.horizontal.3")
                }
                .foregroundColor(.white.opacity(0.85))
            }
        }
        .preferredColorScheme(.light)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("")
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            HomeScreenView()
                .environmentObject(RecipesViewModel())
            }
        }
}
