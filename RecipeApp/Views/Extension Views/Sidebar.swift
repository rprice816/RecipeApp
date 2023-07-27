//
//  Sidebar.swift
//  RecipeApp
//
//  Created by russell price on 5/9/23.
//

import SwiftUI
import Firebase
struct Sidebar: View {
    @Binding var isSidebarVisible: Bool
    @Environment(\.dismiss) private var dismiss
    var sideBarWidth = UIScreen.main.bounds.size.width * 0.7
    var body: some View {
        if isSidebarVisible {
            ZStack {
                GeometryReader { _ in
                    EmptyView()
                }
                .background(.black.opacity(0.6))
                .opacity(isSidebarVisible ? 1 : 0)
                .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
                .onTapGesture {
                    isSidebarVisible.toggle()
                }
                content
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                Color.gray.opacity(0.7)
                VStack(alignment: .leading, spacing: 20) {
                    userProfile
                    Divider()
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "person.circle.fill")
                        NavigationLink("My Account", destination: SettingsView())}
                    .foregroundColor(.white.opacity(0.85))
                    .padding()
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "person.2.fill")
                        NavigationLink("Friends", destination: FriendsView())}
                    .foregroundColor(.white.opacity(0.85))
                    .padding()
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "magnifyingglass")
                        NavigationLink("Search", destination: SearchView())}
                    .foregroundColor(.white.opacity(0.85))
                    .padding()
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "bookmark.fill")
                        NavigationLink("Categories", destination: CategoriesView())}
                    .foregroundColor(.white.opacity(0.85))
                    .padding()

                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "plus")
                        NavigationLink("New Recipe", destination: NewRecipeView())
                                       }
                    .foregroundColor(.white.opacity(0.85))
                    .padding()
                    Divider()
                    Button{
                        do{
                            try Auth.auth().signOut()
                            print("Log out succesful")
                            dismiss()
                        } catch {
                            print("Sign out error")
                        }
                    } label: {
                        Label("Logout",
                              systemImage: "wrench.and.screwdriver.fill")
                    }
                    .foregroundColor(Color.white.opacity(0.85))
                    .padding()
                }
                .padding(.top, 80)
                .padding(.horizontal, 40)
            }
            .frame(width: sideBarWidth)
            .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
            .animation(.default, value: isSidebarVisible)
            Spacer()
        }
    }
    var userProfile: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .stroke(.teal, lineWidth: 2)
                VStack(alignment: .leading, spacing: 6) {
                    Text("John Doe")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title3)
                    Text(verbatim: "john@doe.com")
                        .foregroundColor(.white.opacity(0.85))
                        .font(.caption)
                }
            }
            .padding(.bottom, 20)
        }
    }
}
struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(isSidebarVisible: .constant(true))
            .environmentObject(RecipesViewModel())
    }
}
