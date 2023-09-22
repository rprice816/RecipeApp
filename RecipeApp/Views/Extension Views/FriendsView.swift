//
//  FriendsView.swift
//  RecipeApp
//
//  Created by russell price on 5/9/23.
//

import SwiftUI

struct FriendsView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
                ZStack{
                Rectangle()
                    .fill(Gradient(colors: [.primaryColor2, .primaryColor1]))
                    .ignoresSafeArea()
                VStack{
                    Text("My Friends")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                    List{
                        // make functional friends list
                        NavigationLink(destination: EmptyView()) {
                            Label("Friend Page Link", systemImage: "person.fill")
                            // add profile image instead of system image
                        }
                        .listRowBackground((Color.secondaryColor1.opacity(0.2)))
                        .foregroundColor(.secondaryColor1.opacity(0.85))
                        .fontWeight(.medium)
                        
                    }
                    .scrollContentBackground(.hidden)
                    .preferredColorScheme(.light)
                    NavigationLink(destination: EmptyView()) {
                        Label("Add New Friend", systemImage: "person.fill.badge.plus")
                            .foregroundColor(.secondaryColor1.opacity(0.85))
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    .padding()
                }
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
            .navigationBarBackButtonHidden(true)
        .preferredColorScheme(.light)
    }
}
struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
            FriendsView()
    }
}
