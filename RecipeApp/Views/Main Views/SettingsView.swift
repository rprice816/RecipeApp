//
//  SettingsView.swift
//  RecipeApp
//
//  Created by russell price on 5/9/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Gradient(colors: [.secondary, .teal]))
                .ignoresSafeArea()
            VStack{
                Text("Settings")
                    .foregroundColor(.white.opacity(0.85))
                    .font(.title)
                    .font(.headline)
                    Circle()
                        .stroke(.white, lineWidth: 2)
                        .frame(width: 150)
                    VStack(alignment: .leading, spacing: 6) {
                        Text("John Doe")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .font(.title2)
                        Text(verbatim: "john@doe.com")
                            .foregroundColor(.white.opacity(0.85))
                            .font(.subheadline)
                }
                Spacer()
            }
        }
        .preferredColorScheme(.light)

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SettingsView()}
    }
}
