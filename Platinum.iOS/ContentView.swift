//
//  ContentView.swift
//  Platinum.iOS
//
//  Created by User on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State var search: String = ""
    var body: some View {
        ZStack{
            
            
            VStack {
                
                HStack{
                    TextField("Поиск", text:$search)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button("Найти"){
                        
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 100, height: 4)
                }
            }
            .padding()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
