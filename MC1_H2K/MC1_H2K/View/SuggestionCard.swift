//
//  SuggestionCard.swift
//  MC1_H2K
//
//  Created by Dhil Khairan Badjiser on 03/05/23.
//

import SwiftUI

struct SuggestionCard: View {
    
    @Binding var CardTitle : String
    @Binding var CardAction : String
    @Binding var CardDescription : String
    @Binding var CardLink : String
    @State var ErrorMessage :String = ""
    @State var ShowAlert : Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text(CardTitle)
                    .font(.title3.bold())
                    .foregroundColor(Color(UIColor(named: "teal600")!))
                    .padding(.horizontal)
                
                Spacer()
                if CardLink == "ConversationStarter"{
                    NavigationLink(destination: ConversationStarter()) {
                        Text(CardAction)
                            .font(.caption2.bold())
                            .foregroundColor(Color("teal600"))
                            .padding()
                            .background(
                                Color("teal100")
                            )
                            .cornerRadius(50)
                    }.padding(.horizontal)
                }else{
                    Button(action: {
                        let CardURL = URL(string: CardLink)!
                        if UIApplication.shared.canOpenURL(CardURL){
                            UIApplication.shared.open(CardURL)
                        } else{
                            ErrorMessage = "Aplikasi belum ada di Handphone anda"
                            ShowAlert = true
                        }
                        
                    }, label: {
                        Text(CardAction)
                            .font(.caption2.bold())
                            .foregroundColor(Color("teal600"))
                            .padding()
                            .background(
                                Color("teal100")
                            )
                            .cornerRadius(50)
                    }) .alert(isPresented: $ShowAlert) {
                        Alert(title: Text("Mohon Maaf"), message: Text(ErrorMessage), dismissButton: .default(Text("OK")))
                    }
                    .padding(.horizontal)
                }}
            .padding(.horizontal, 0.5)
            .padding(.bottom,0.5)
            
            HStack {
                Text(CardDescription)
                    .padding(.horizontal)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                Spacer()
            }
        }
        .padding(.vertical)
        .frame(width: .infinity, height: .infinity)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor(named: "teal25")!)))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(UIColor(named: "teal500")!), lineWidth:1))
        .padding(.horizontal,24)
        .padding(.vertical,0.5)
    }
    
    struct ResultGraph_Previews: PreviewProvider {
        static var previews: some View {
            SuggestionCard(CardTitle: .constant("Instructions"), CardAction: .constant("Hubungi Sekarang"), CardDescription: .constant("Lorem ipsum dolor sit amet consectetur. Risus lorem cursus mollis lectus id. Sed curabitur nibh purus semper nisi pellentesque pulvinar. Risus mattis morbi at sed odio pharetra. Condimentum consequat eget bibendum nam nec dolor a tellus venenatis. Vitae sodales commodo sodales etiam nascetur morbi."), CardLink: .constant("contacts://"))
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Graph")
        }
    }
}



