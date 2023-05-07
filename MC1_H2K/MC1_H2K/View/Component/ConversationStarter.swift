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
    @StateObject var viewModel = AppliedViewModel()
    @FetchRequest(entity: Compatibility.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])
    private var comp: FetchedResults<Compatibility>
    private let pastboard = UIPasteboard.general
    var body: some View {
        List(viewModel.showCSCards(aS: !comp.isEmpty ? comp[0].yourAS! : "Anxious", role: !comp.isEmpty ? comp[0].role! : "Children")) { card in
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
                }
                .padding(.top,8)
                .listRowBackground(Color("teal25"))
                .navigationBarTitle("Conversation Starter")
                .edgesIgnoringSafeArea(.bottom)
            }
            .scrollContentBackground(.hidden)
    }
}

struct ConversationStarter_Previews: PreviewProvider {
    static var previews: some View {
        ConversationStarter()
    }
}
