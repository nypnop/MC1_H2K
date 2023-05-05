//
//  ConversationStarter.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 04/05/23.
//
import SwiftUI
struct CSData: Identifiable {
    let id = UUID()
    let message: String
    let subMessage: String
}
struct ConversationStarter: View {
    let CSCards = [
        CSData(message: "chat wa 1", subMessage: "deskripsi chat wa 1"),
        CSData(message: "chat wa 2", subMessage: "deskripsi chat wa 2"),
        CSData(message: "chat wa 3", subMessage: "deskripsi chat wa 3"),
    ]
    private let pastboard = UIPasteboard.general
    var body: some View {
            List(CSCards) { card in
                VStack(alignment: .leading) {
                    HStack{
                        Text(card.message)
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                  let window = windowScene.windows.first else {
                                return
                            }
                            let activityViewController = UIActivityViewController(activityItems: [card.message], applicationActivities: nil)
                            window.rootViewController?.present(activityViewController, animated: true, completion: nil)
                        }, label: {
                            Image(systemName: "doc.on.doc")
                                .foregroundColor(Color("teal500"))
                        })
                    }.padding(.bottom,1)
                    
                    Text(card.subMessage)
                        .font(.subheadline)
                }.padding(.top,8)
                    .navigationBarTitle("Conversation Starter")
                    .edgesIgnoringSafeArea(.bottom)
            }
          
    }
}

struct ConversationStarter_Previews: PreviewProvider {
    static var previews: some View {
        ConversationStarter()
    }
}
