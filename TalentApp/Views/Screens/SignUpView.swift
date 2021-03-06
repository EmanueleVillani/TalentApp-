//
//  SignUpView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 01/05/2021.
//

import SwiftUI

struct SignUpView: View {
    
    @State var shoeOnboarding: Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 2, content: {
            
            Spacer()
            Image("logo.transparent")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100, alignment: .center)
            
            Text("You're not signed in! 🙁")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Text("Click the button below to create an account and join the fun")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Button(action: {
                shoeOnboarding.toggle()
            }, label: {
                Text("Sign in /  Sign Up".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.purpleColor)
                    .cornerRadius(12)
                    .shadow(radius: 12 )
            })
            .accentColor(Color.MyTheme.yellowColor)
            
            Spacer()
            Spacer()
        })
        .padding(.all,40)
        .background(Color.MyTheme.yellowColor)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $shoeOnboarding, content: {
            OnboardingView()
        })
        
       
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .preferredColorScheme(.dark)
    }
}
