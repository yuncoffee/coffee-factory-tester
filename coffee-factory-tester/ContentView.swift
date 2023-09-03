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
//                .padding(.spacing(.medium))
                .border(.red, width: 2)
                .background(Color.systemGray100)
                .cornerRadius(.CFCornerRadius.round)
                .clipped()
                
            Text("Anatomy Of, \nAnatomyasdasda Of")
//            .lineLimit(1)
                .multilineTextAlignment(.trailing)
            .frame(width: 200)
            .border(.red)
            .background(Color.CFPrimary.lightness)
            CFButton(
                label: "Hello", size: .xlarge, type: .boxLine, action: {
                    print("hello")
                } )
            CFButton(
                label: "world", size: .xlarge, type: .boxLine, action: {
                    print("world")
                } )
//            Card(title: "My Card",
//                 width: 240)
            Button {
                print("1111")
            } label: {
                Text("1111")
            }
            Button {
                print("2222")
            } label: {
                Text("11222211")
            }
            MyMy {
                print("날라와라")
            }
            MyMy {
                print("이리와라")
            }
        }
        .systemFont(.caption)
        .padding()
    }
}

struct MyMy: View {
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text("왜안돼")
            CFButton(
                label: "world", size: .xlarge, type: .roundFill, action: {
                    action()
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .environment(\.colorScheme, .dark)
        }
    }
}
