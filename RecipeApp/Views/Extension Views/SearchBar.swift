//
//  SearchBar.swift
//  Food delivery
//
//  Created by Usman Mukhtar on 21/07/2020.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondaryColor1.opacity(0.85))
            TextField("Search for a recipe", text: $text)
                .padding()
                .frame(width: 300, height: 35)
                .background(Color.secondaryColor1.opacity(0.5))
                .cornerRadius(10)
                        if isEditing {
                            Button(action: {
                                self.isEditing = false
                                self.text = ""
                                
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }){
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.secondaryColor1.opacity(0.85))
                            }
                            .padding(.trailing, 10)
                            .transition(.move(edge: .trailing))
                        }
                    }
                        .onTapGesture {
                    self.isEditing = true
                }
        }
    }
