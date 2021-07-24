//
//  OnboardingView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 01/05/2021.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showOnboarding2: Bool = false
    @State var showErrore: Bool = false
    var body: some View {
        VStack(spacing: 10) {
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .shadow(radius: 12 )
            
            Text("Welcome to Talent!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.purpleColor)
            
           Text(loc("DESCR_APP_TALENT"))
            .font(.headline)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .foregroundColor(Color.MyTheme.purpleColor)
            .padding()
            
            // SIGN IN WITH APPLE
            Button(action: {
                signInWithApple.instance.startSignInWithAppleFlow(view: self)
                //showOnboarding2.toggle()
                
            }, label: {
              SignInWhithAppleButtonCustom()
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                
            })
          // SIGN IN WITH GOOGLE
            Button(action: {
                showOnboarding2.toggle()
                
            }, label: {
                HStack{
                    
                    Image(systemName: "globe")
                    
                    Text("Sign in with Google")
                    
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color(.sRGB,red: 222/255, green: 82/255, blue: 70/255, opacity: 1.0))
                .cornerRadius(4)
                .font(.system(size: 23, weight: .medium, design: .default))
                
            })

            .accentColor(Color.white)
            //
            Button(action: {
                showOnboarding2.toggle()
                presentationMode.wrappedValue.dismiss()
                
            }, label: {
                Text("Continue as guest".uppercased())
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
            })
            .accentColor(.black)
        }
        .padding(.all,20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.beigeColor)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showOnboarding2, content: {
            OnboardingViewPart2()
        })
        .alert(isPresented: $showErrore, content: {
            return Alert(title: Text("ERROR sign in 🙁"))
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
