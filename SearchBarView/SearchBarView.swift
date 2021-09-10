//
//  SearchBarView.swift
//  MessagingApp
//
//  Created by Erdem Senol on 7.09.2021.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    @State private var isEditing = false
    @Binding var isLoading: Bool
    
    var body: some View {
        HStack {
            
            TextField("Search", text: $text)
                .padding(12)
                .padding(.leading, 24)
                .background(Color.gray.opacity(0.34))
                .cornerRadius(8)
                .foregroundColor(.black)
                .onTapGesture {
                    withAnimation(.easeInOut){
                        isEditing = true
                    }
                }
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 8)
                            .font(.system(size: 18))
                    }.foregroundColor(.gray)
                    ,alignment: .leading
                )
                .overlay(
                    Button(action: {
                        text = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .padding(8)
                    }).opacity(isLoading || text.isEmpty ? 0 : 1)

                    ,alignment: .trailing
                )
                .overlay(
                    ProgressView()
                        .padding(8)
                        .opacity(isLoading && !text.isEmpty ? 1 : 0)
                    ,alignment: .trailing
                )
            if isEditing{
                Button(action: {
                    text = ""
                    withAnimation(.easeInOut){
                        isEditing = false
                    }
                    hideKeyboard()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                }).transition(.move(edge: .trailing))
                .animation(.default)
            }
            
        }.frame(width: UIScreen.main.bounds.width - 20, height: 60)
    }
}


extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

