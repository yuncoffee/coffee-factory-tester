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
            Text("Hello, world!")
                .padding(.spacing800)
                .border(.red, width: 2)
                .background(Color.blue)
                .cornerRadius(.cornerRadius(.xlarge))
                .clipped()
        }
        .padding()
    }
}

extension CGFloat {
    public static var spacing100: CGFloat = 60.0
}

//extension CGFloat: SpacingSize {
//    public static var spacing400: CGFloat {
//        20.0
//    }
//
////    static var spacing200: CGFloat {
////        60.0
////    }
//
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
