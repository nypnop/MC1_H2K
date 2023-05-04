//
//  TestPageView.swift
//  MC1_H2K
//
//  Created by Dwianditya Hanif Raharjanto on 29/04/23.
//

import SwiftUI

struct TestPageView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var progressValue: Double = 0
    @State var progressPercantage: Float = 0
    @State var isSubmit: Bool = false
    @State var size: Double = 0.5
    @State var opacity: Double = 0.5
    @State var secure: Int64 = 0
    @State var avoidant: Int64 = 0
    @State var anxious: Int64 = 0
    @State var disorganize: Int64 = 0
    let questionList: [Question] = [
//                SECURE
        Question(questionPrompt: "Saya merasa santai dan nyaman berada bersama orang tua saya", tags: "secure", point: 0),
        Question(questionPrompt: "Saya mudah untuk beradaptasi dari dekat dengan orang tua saya dan sendirian", tags: "secure", point: 0),
        Question(questionPrompt: "Jika saya dan orang tua saya ada perselisihan, mudah bagi saya untuk meminta maaf dan mencari solusi yang senang untuk kita bersama, atau memperbaiki hubungan menjadi lebih selaras.", tags: "secure", point: 0),
        Question(questionPrompt: "Orang lain pada dasarnya baik hati.", tags: "secure", point: 0),
        Question(questionPrompt: "Menepati janji dengan orang tua adalah prioritas utama.", tags: "secure", point: 0),
        Question(questionPrompt: "Saya mencoba untuk mencari tahu dan memenuhi kebutuhan orang tua saya setiap ada kesempatan dan nyaman juga untuk menunjukkan apa yang saya mau.", tags: "secure", point: 0),
        Question(questionPrompt: "Saya secara aktif berusah melindungi orang tua saya dari bahaya dan menjaga hubungan yang nyaman dengan mereka.", tags: "secure", point: 0),
        Question(questionPrompt: "Saya memandang orang tua saya dengan kebaikan dan rasa peduli, ingin segera merasakan kebersamaan.", tags: "secure", point: 0),
        Question(questionPrompt: "Saya nyaman untuk menunjukkan sayang kepada orang tua saya.", tags: "secure", point: 0),
        Question(questionPrompt: "Saya bisa menjaga rahasia, menjaga privasi mereka, dan menghargai batasan.", tags: "secure", point: 0),
//                AVOIDANT
        Question(questionPrompt: "Saat orang tua saya sampai di rumah atau mendatangi saya, saya merasa stress, terutama saat mereka mau berkomunikasi.", tags: "avoidant", point: 0),
        Question(questionPrompt: "Saya melihat diri saya menghindari memiliki hubungan yang erat di hidup saya.", tags: "avoidant", point: 0),
        Question(questionPrompt: "Saya mengutamakan kemandirian, saya memiliki kesulitan meminta bantuan ketika dibutuhkan, dan kebanyakan hobi saya kerjakan sendiri.", tags: "avoidant", point: 0),
        Question(questionPrompt: "Saya merasa lebih superior karena kemandirian saya dan berharap orang lain lebih mandiri.", tags: "avoidant", point: 0),
        Question(questionPrompt: "Saya merasa orang tua saya selalu ada namun saya merasa lebih senang sendiri.", tags: "avoidant", point: 0),
        Question(questionPrompt: "Saya lebih memilih memiliki hubungan yang sekedarnya saja dibanding hubungan yang penuh komitmen.", tags: "avoidant", point: 0),
        Question(questionPrompt: "Saya lebih memilih hubungan dengan hewan dibanding manusia.", tags: "avoidant", point: 0),
        Question(questionPrompt: "Saya sulit untuk kontak mata dengan orang lain.", tags: "secure", point: 0),
        Question(questionPrompt: "Mudah untuk saya memikirkan sesuatu dibanding mengekspresikan diri saya secara emosional.", tags: "avoidant", point: 0),
        Question(questionPrompt: "Ketika saya kehilangan satu hubungan, pertama saya akan merasa lega, kemudian saya merasa depresi.", tags: "avoidant", point: 0),
//                ANXIOUS
        Question(questionPrompt: "Saya selalu mengharapkan sesuatu atau seseorang yang saya tidak bisa peroleh dan jarang merasa puas.", tags: "anxious", point: 0),
        Question(questionPrompt: "Kadang, saya berlebihan dalam beradaptasi, memenuhi kebutuhan, dan meminta maaf atas sesuatu yang tidak saya lakukan hanya dengan tujuan untuk menyelaraskan hubungan.", tags: "anxious", point: 0),
        Question(questionPrompt: "Terlalu fokus kepada orang lain, kadang saya kehilangan diri saya sendiri.", tags: "anxious", point: 0),
        Question(questionPrompt: "Sangat sulit bagi diri saya untuk mengatakan tidak dan menentukan batasan yang sehat.", tags: "anxious", point: 0),
        Question(questionPrompt: "Saya sering meragukan diri sendiri dan berharap saya mengucapkan hal yang berbeda.", tags: "anxious", point: 0),
        Question(questionPrompt: "Ketika saya memberi lebih banyak dibanding yang saya dapatkan, saya sering kesal dan penuh dendam. Sulit untuk menerima cinta dari orang tua saya ketika mereka mengekspresikannya.", tags: "anxious", point: 0),
        Question(questionPrompt: "Sulit bagi saya untuk menyendiri. Jika menyendiri, saya merasa stress, terbuang, sakit, atau marah.", tags: "anxious", point: 0),
        Question(questionPrompt: "Saya berharap untuk bisa selalu bersama orang tua saya dan saya juga memiliki ketakutan yang mendalam bahwa saya akan kehilang mereka suatu hari nanti.", tags: "anxious", point: 0),
        Question(questionPrompt: "Saya mau dekat dengan orang tua saya namun juga merasa marah pada mereka. Setelah menanti kedatangan orang tua saya, saya malah mencari masalah dengan mereka.", tags: "anxious", point: 0),
        Question(questionPrompt: "Saya sering kali kehilangan diri saya kepada orang tua saya sehinggan merasakan yang mereka rasakan dan menginginkan yang mereka inginkan.", tags: "anxious", point: 0),
//                DISORGANIZED
        Question(questionPrompt: "Ketika saya cukup dekat dengan seseorang, kadang saya merasa ketakutan.", tags: "disorganized", point: 0),
        Question(questionPrompt: "Ketika dihadapi dengan masalah, saya sering merasa buntu dan rasanya masalahnya tidak terselesaikan.", tags: "disorganized", point: 0),
        Question(questionPrompt: "Saya punya respon yang cukup mengejutkan ketika tiba tiba seseorang mendekati saya.", tags: "disorganized", point: 0),
        Question(questionPrompt: "Orang dekat saya sering mengatakan kepada saya bahwa saya suka ngatur.", tags: "disorganized", point: 0),
        Question(questionPrompt: "Saya sering membayangkan hal yang terburuk terjadi dalam hubungan saya.", tags: "disorganized", point: 0),
        Question(questionPrompt: "Perlindungan sering terasa sulit dijangkau. Saya kesulitan untuk merasa aman dengan orang terdekat saya.", tags: "disorganized", point: 0),
        Question(questionPrompt: "Saya memiliki kesulitan mengingat dan mendiskusikan perasaan saya terkait masalah dalam hubungan masa lalu saya.", tags: "disorganized", point: 0),
        Question(questionPrompt: "Saya ingin memiliki hubungan dekat dengan seseorang namun saya juga merasa takut dengan orang tersebut.", tags: "disorganized", point: 0),
        Question(questionPrompt: "Insting saya untuk melindungi diri sering kali hilang saat keadaan ia dibutuhkan, sehingga saya menjadi diam, atau panik sendiri.", tags: "disorganized", point: 0),
        Question(questionPrompt: "Karena saya sering kebingungan dan tidak teratur, terutama saat stress, penting untuk partner saya mengatur segala sesuatu menjadi sederhana dan jelas.", tags: "disorganized", point: 0),
    ]
    
    var body: some View {
            ScrollView {
                LazyVStack(alignment: .center, spacing: 32, pinnedViews: !isSubmit ? [.sectionHeaders, .sectionFooters]:.sectionHeaders){
                    Section(header: ProgressBarTemplate(value: $progressPercantage).frame(height:4),
                            footer:FooterView(isSubmit: $isSubmit, progressValue: $progressPercantage, secure: $secure, avoidant: $avoidant, anxious: $anxious, disorganize: $disorganize).opacity(!isSubmit ? 1 : 0))
                    {
                        if(!isSubmit){
                            ForEach(Array(questionList.enumerated()), id: \.element.id) { index, question in
                                QuestionView(number: index + 1, questionPrompt: question.questionPrompt, tags: question.tags, isClick: false, progressValue: $progressValue, progressPercantage: $progressPercantage, secure: $secure, avoidant: $avoidant, anxious: $anxious, disorganize: $disorganize)
                            }
                            .padding(.bottom,-32)
                        } else {
                            Group {
                                LottieView(
                                    name:"done",
                                    loopMode: .loop
                                )
                                .frame(width: 300,height: 300)
                                .scaledToFit()
                                .onAppear {
                                    withAnimation(.easeIn(duration: 1.0)){
                                        self.size = 1.0
                                        self.opacity = 1.0
                                    }
                                }
                                .padding(.top,140)
                                Button(action: {
                                    
                                }) {
                                    Label("Go To Result", image: "back-icon")
                                }
                                .buttonStyle(BigButtonTemplate(width: 300, height:25))
                                .padding(.top,-140)
                            }
                            .navigationBarBackButtonHidden(true)
                        }
                    }
                }
            }
            .navigationBarTitle("Attachment Style Test")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color(UIColor(named: "teal500")!))
                            .imageScale(.large)
                        Text("Back")
                            .foregroundColor(Color(UIColor(named: "teal500")!))
                    }
                }
            )
    }
}

struct Question: Identifiable {
    let id = UUID()
    let questionPrompt: String
    let tags: String
    let point: Int
}

struct TestPageView_Previews: PreviewProvider {
    static var previews: some View {
        TestPageView()
    }
}

struct FooterView: View {
    @StateObject var viewModel = ResultViewModel()
    
    @Binding var isSubmit: Bool
    @Binding var progressValue: Float
    @Binding var secure: Int64
    @Binding var avoidant: Int64
    @Binding var anxious: Int64
    @Binding var disorganize: Int64
    var body: some View{
        VStack {
            Button(action: {
                isSubmit=true
                progressValue=1.0
                viewModel.addTestResult(secure: secure, avoidant: avoidant, anxious: anxious, disorganize: disorganize)
            }) {
                Label("Submit", image: "check-icon")
            }
            .padding(.bottom,28)
            .padding(.top,-50)
            .padding([.trailing,.leading],40)
            .buttonStyle( BigButtonTemplate(width: 342, height:25))
            .background(.white)
            
        }
        
    }
}
