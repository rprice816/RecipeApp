//
//  Sidebar.swift
//  RecipeApp
//
//  Created by russell price on 5/9/23.
//

import SwiftUI
import Firebase
struct Sidebar: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var authModel: AuthViewModel
    var body: some View {
            VStack{
            List{
                NavigationLink(destination: SettingsView()) {
                    Label("My Account", systemImage: "person.circle.fill")
                }
                .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                .foregroundColor(.secondaryColor1.opacity(0.85))
                .fontWeight(.medium)
                NavigationLink(destination: FriendsView()) {
                    Label("Friends", systemImage: "person.2.fill")
                }
                .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                .foregroundColor(.secondaryColor1.opacity(0.85))
                .fontWeight(.medium)
                NavigationLink(destination: EmptyView()) {
                    Label("Categories", systemImage: "bookmark.fill")
                }
                .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                .foregroundColor(.secondaryColor1.opacity(0.85))
                .fontWeight(.medium)
                Button{
                        do{
                            try Auth.auth().signOut()
                                print("Log out succesful")
                                dismiss()
                        } catch {
                                print("Sign out error")}
                        } label: {
                            Label("Logout", systemImage: "wrench.and.screwdriver.fill")
                            
                        }
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .fontWeight(.medium)
            }
            .scrollContentBackground(.hidden)
            .background(Gradient(colors: [.primaryColor2, .primaryColor1]))
            .preferredColorScheme(.light)
            .listStyle(SidebarListStyle())
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
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
    }
}
    struct Sidebar_Previews: PreviewProvider {
        static var previews: some View {
            Sidebar()

        }
    }
