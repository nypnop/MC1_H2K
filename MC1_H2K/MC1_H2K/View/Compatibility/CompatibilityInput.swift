//
//  CompatibilityInput.swift
//  MC1_H2K
//
//  Created by Bayu Alif Farisqi on 02/05/23.
//

import SwiftUI


struct CompatibilityInput: View {
    @StateObject var viewModel = CompatibilityViewModel()
    let roleOptions = ["Children", "Parent"]
    let styleOption = ["Secure","Anxious","Dismissive Avoidant","Fearful-Avoidant"]
    @State private var selectedRoleOption = "Children"
    @State private var selectedStyleOption = "Secure"
    @State private var selectedOtherStyleOption = "Secure"
    @State private var selectedOption = 0
        let options = ["Option 1", "Option 2", "Option 3"]
    var body: some View {
        VStack{
            HStack{
                Text("Input Your Information")
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("teal500"))
                Spacer()
            }.padding(.horizontal)
            NavigationView{
                    Form {
                        Section{
                            Picker("Choose your Role", selection: $selectedRoleOption) {
                                ForEach(roleOptions, id: \.self) {
                                    Text($0)
                                }
                            }.font(.caption)
                        }
                        Section{
                            Picker("Choose your style", selection: $selectedStyleOption) {
                                ForEach(styleOption, id: \.self) {
                                    Text($0)
                                }
                            }.font(.caption)
                            Picker("Choose the other style", selection: $selectedOtherStyleOption) {
                                ForEach(styleOption, id: \.self) {
                                    Text($0)
                                }
                            }.font(.caption)
                        }
                        
                    }
                    .scrollContentBackground(.hidden)
                    .padding(.top,-30)
                    .padding(.horizontal, -5)
                    .background(Color("teal25"))
                    
            }.frame(maxWidth: .infinity, maxHeight: 180)
            VStack{
                Button(action: {
                    viewModel.addCompatibility(yourAS: selectedStyleOption, otherAS: selectedOtherStyleOption, role: selectedRoleOption, comment: "You Good ?", image: selectedStyleOption, image2: selectedOtherStyleOption)
                    print(viewModel.compatibilityArray)
                }, label: {
                    Text("Submit")
                        .font(.body)
                        .bold()
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(
                           Color("teal500")
                            .cornerRadius(14)
                        )
                })
            }.padding()
        }.frame(width: .infinity, height: .infinity)
            .padding(.top)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color("teal25")))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("teal500"), lineWidth:1))
            .padding(.top)
            .padding(.horizontal,24)
    }
    
    
}

struct CompatibilityInput_Previews: PreviewProvider {
    static var previews: some View {
        CompatibilityInput()
    }
}
