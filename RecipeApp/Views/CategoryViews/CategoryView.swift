//
//  CategoryView.swift
//  RecipeApp
//
//  Created by russell price on 8/31/23.
//

import SwiftUI

struct CategoryView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
            VStack{
                List{
                    NavigationLink("Mains", destination: EmptyView())
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .fontWeight(.medium)
                    NavigationLink("Appetizers", destination: EmptyView())
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .fontWeight(.medium)
                    NavigationLink("Sides", destination: EmptyView())
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .fontWeight(.medium)
                    NavigationLink("Desserts", destination: EmptyView())
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .fontWeight(.medium)
                    NavigationLink("Drinks", destination: EmptyView())
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .fontWeight(.medium)
                }
                .scrollContentBackground(.hidden)
                .background(Gradient(colors: [.primaryColor2, .primaryColor1]))
                .preferredColorScheme(.light)
                .listStyle(SidebarListStyle())
        }
        .navigationBarBackButtonHidden(true)
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
    }
}

#Preview {
    CategoryView()
}
