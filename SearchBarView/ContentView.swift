//
//  ContentView.swift
//  SearchBarView
//
//  Created by Erdem Senol on 10.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    @State var isLoading = false
    
    var body: some View {
        SearchBarView(text: $text, isLoading: $isLoading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
