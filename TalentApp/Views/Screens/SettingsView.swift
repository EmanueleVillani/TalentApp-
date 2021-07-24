//
//  SettingsView.swift
//  TalentApp
//
//  Created by Emanuele Villani on 30/04/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var  presentationMode
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false, content: {
                
                // MARK SECTION !: TalentGram
                GroupBox(label: SettingsLabelView(labeltext: "Talent", labelImage: "dot.radiowaves.left.and.right"), content: {
                    HStack(alignment: .center, spacing: 10, content: {
                      Image("logo.transparent")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80, alignment: .center)
                        .cornerRadius(12)
                        
                        
                        Text(loc("DESCR_APP_TALENT"))
                            .font(.footnote)
                    })
                   
                })
                .padding()
                
                // MARK SECTION ": PROFILE
                
                GroupBox(label: SettingsLabelView(labeltext: "Profile", labelImage: "person.fill"), content: {
                    
                    NavigationLink(
                        destination: SettingsEditTextView(submissionText: loc("EDIT_DISP_NAM_TXTFIE"), title: loc("EDIT_DISP_NOM"), description: loc("EDIT_DESCR_MOD"), placeholder: loc("PLACEHOLDER")),
                        label: {
                            SettingsRowView(leftIcon: "pencil", text: loc("EDIT_DISP_NOM"), color: Color.MyTheme.purpleColor)                        })
                   
                    NavigationLink(
                        destination: SettingsEditTextView(submissionText: loc("SCR_BIO"), title: loc("BIOPROF"), description: loc("DESC_PROF"), placeholder: loc("PLACEHOL_BIO")),
                        label: {
                            SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.MyTheme.purpleColor)
                        })
                  
                    NavigationLink(
                        destination: SettingEditImageView(title: "Profile Picture", description: "You profile picture will be shown on your profile and on your posts. Most users make it an image of themselves or of theire Talent", selectdImage: UIImage(named: "dog1")!),
                        label: {
                            SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.MyTheme.purpleColor)
                        })
                  
                    
                    SettingsRowView(leftIcon: "figure.walk", text: loc("DISCONN"), color: Color.MyTheme.purpleColor)
                })
                .padding()
                
                // MARK SECTION 3: APPLIVATION
                
                
                GroupBox(label: SettingsLabelView(labeltext: "Application", labelImage: "apps.iphone"), content: {
                    
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.google.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.yellowColor)
                    })
                    
                    Button(action: {
                        openCustomURL(urlString: "https://play.google.com/store/apps/developer?id=Emanuele+Villani")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: loc("TERM&COND"), color: Color.MyTheme.yellowColor)
                    })
                    
                   
                    Button(action: {
                        openCustomURL(urlString: "https://emanuelevillani.itch.io/")
                    }, label: {
                        SettingsRowView(leftIcon: "globe", text: "Talent's e Contact", color: Color.MyTheme.yellowColor)
                      
                    })
                  
                })
                .padding()
                // MARK : SECTION : SIGN OFF
                GroupBox {
                    Text(loc("FOOTER"))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        
                }
                .padding()
                .padding(.bottom, 80)
                
            })
             
            
            
            .navigationBarTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading:
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .font(.title)
                                    })
                                    .accentColor(.primary)
            )
            
        }
        .accentColor(colorScheme == .light ? Color.MyTheme.purpleColor: Color.MyTheme.yellowColor)
        }
       
    // MARK: FUNCTIONS
    
    func openCustomURL(urlString: String){
        guard let url = URL(string: urlString) else {return}
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
