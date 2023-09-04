//
//  ContentView.swift
//  coffee-factory-tester
//
//  Created by Yun Dongbeom on 2023/08/31.
//

import SwiftUI
import CoffeeFactorySwift

struct ContentView: View {
    
    var myCFButton: CFButton = CFButton(
        label: "Hello World",
        size: .xlarge,
        type: .roundFill,
        action: {
            print("hello")
        })
    var myImage: Image = Image("sample")
    
    var body: some View {
        VStack {
            Text("ddd")
                .foregroundColor(.CFSecondary.orange)
            CFButton(
                label: "Hello World", size: .xlarge, type: .boxLine, action: {
                    print("hello")
                })
            CFButton(
                label: "World Hello", type: .roundFill, action: {
                    print("world")
                } )
            Card(title: "MyCard", width: 360) {
                myImage
            }
            Card(title: "MyCardType2", width: 320, tintColor: .systemWhite) {
                myImage
            } button: {
                myCFButton
            } additionalInfo: {
                CFLabel(label: "World", size: .xlarge, color: .CFSecondary.deepblue)
            }
            .background(Color.CFSecondary.pink)
            .cornerRadius(.CFCornerRadius.xxlarge)
        }
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
