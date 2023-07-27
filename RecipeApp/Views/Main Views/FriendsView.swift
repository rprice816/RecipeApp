//
//  FriendsView.swift
//  RecipeApp
//
//  Created by russell price on 5/9/23.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Gradient(colors: [.secondary, .teal]))
                .ignoresSafeArea()
            Text("Hello, Friends!")
                .foregroundColor(.white.opacity(0.85))
        }
        .preferredColorScheme(.light)
    }
}
struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            FriendsView()
        }
    }
}
