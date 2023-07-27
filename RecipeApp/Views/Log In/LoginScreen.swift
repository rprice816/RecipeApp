//
//  LoginScreen.swift
//  RecipeApp
//
//  Created by russell price on 5/4/23.
//

//
//  LoginScreen.swift
//  MyProject


import SwiftUI
import Firebase
struct LoginScreen: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            ZStack{
                Rectangle()
                    .fill(Gradient(colors: [.secondary, .teal]))
                    .ignoresSafeArea()
                VStack {
                    Image("recipeBookImage")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 340, height: 450)
                        .clipped()
                        .overlay(alignment: .topLeading) {
                            VStack(alignment: .leading, spacing: 11) {
                                RoundedRectangle(cornerRadius: 17, style: .continuous)
                                    .fill(.teal.opacity(0.85))
                                    .frame(width: 72, height: 72)
                                    .clipped()
                                    .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue: 0/255).opacity(0.12), radius: 8, x: 0, y: 4)
                                    .overlay {
                                        Image(systemName: "book")
                                            .foregroundColor(Color.white)
                                            .imageScale(.large)
                                            .symbolRenderingMode(.monochrome)
                                            .font(.system(size: 31, weight: .regular, design: .default))
                                    }
                                VStack(alignment: .leading, spacing: 1) {
                                    Text("Family Recipes")
                                        .font(.system(.largeTitle, weight: .medium))
                                        .fontWeight(.semibold)
                                    
                                    Text("Welcome to the future of family recipe books.")
                                        .font(.system(.headline, weight: .medium))
                                        .frame(width: 190, alignment: .center)
                                        .clipped()
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(.black))
                                }
                            }
                            .padding()
                            .padding(.top, 42)
                        }
                        .overlay(alignment: .bottom) {
                        }
                        .mask {
                            RoundedRectangle(cornerRadius: 24, style: .continuous)
                        }
                        .padding()
                        .shadow(color: Color(.sRGBLinear, red: 0/255, green: 0/255, blue: 0/255).opacity(0.15), radius: 18, x: 0, y: 14)
                    VStack{
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "envelope.fill")
                                .imageScale(.medium)
                            NavigationLink("Continue with Email", destination: EmailLoginView())}
                        .foregroundColor(.white)
                        .frame(width:300, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "envelope.fill")
                                .imageScale(.medium)
                            NavigationLink("Continue with Gmail", destination: EmailLoginView())}
                        .foregroundColor(.black)
                        .frame(width:300, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "apple.logo")
                                .imageScale(.medium)
                            NavigationLink("Continue with Apple", destination: EmailLoginView())}
                        .foregroundColor(.white)
                        .frame(width:300, height: 50)
                        .background(Color.black)
                        .cornerRadius(10)
                        NavigationLink("Don't Have an Account?", destination: CreateAccountView())
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                    .navigationDestination(for: String.self) { view in
                        if view == "HomeScreenView" {
                            HomeScreenView()
                        }
                    }
                }
            }
            .toolbar(.hidden)
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if Auth.auth().currentUser != nil {
                print("Login Succcess")
                path.append("HomeScreenView")
            }
        }
        .preferredColorScheme(.light)
    }
}
struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .environmentObject(RecipesViewModel())
    }
}
