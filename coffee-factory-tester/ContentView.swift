//
//  ContentView.swift
//  coffee-factory-tester
//
//  Created by Yun Dongbeom on 2023/08/31.
//

import SwiftUI
import CoffeeFactorySwift


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
//                .padding(CoffeeFactorySwift.init().myFloat)
                .border(.red, width: 2)
            Text("Anatomy Of, \nAnatomy Of")
                .systemFont(.largeTtile)
                .padding(.spacing(.medium))
                .border(.red, width: 2)
                .background(Color.blue)
                .cornerRadius(.cornerRadius(.xlarge))
                .clipped()
                
            Text("Anatomy Of, \nAnatomy Of")
                .systemFont(.largeTtile)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
