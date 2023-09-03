//
//  Card.swift
//  coffee-factory-tester
//
//  Created by Yun Dongbeom on 2023/09/03.
//

import SwiftUI

struct Card<B: View, L: View>: View where B: Composble, L: Composble {
    var title: String = "Card Title"
    var subTitle: String? = nil
    var width: CGFloat
    
    let button: () -> B?
    let additionalInfo: () -> L?
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image("sample")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        maxWidth: width,
                        maxHeight: width / 16 * 9,
                        alignment: .bottom
                    )
                    .contentShape(Rectangle())
                    .clipped()
                additionalInfo()
                    .offset(x: -.CFSpacing.small, y:.CFSpacing.small)
                CFLabel(label: "ff")
                    .offset(x: -.CFSpacing.small, y:.CFSpacing.small)
            }
            .frame(
                maxWidth: width,
                maxHeight: width / 16 * 9,
                alignment: .bottom
            )
            VStack {
                HStack(spacing: .CFSpacing.xsmall) {
                    textContainer()
                    button()
                }
                .padding(.CFSpacing.xsmall)
            }
        }
        .background(Color.systemWhite)
        .frame(width: width)
    }
}

extension Card where B == EmptyView {
    init(title: String, subTitle: String? = nil, width: CGFloat = 200, additionalInfo: @escaping () -> L) {
        self.init(
            title: title,
            subTitle: subTitle,
            width: width,
            button: { EmptyView() },
            additionalInfo: additionalInfo
        )
    }
}

extension Card where L == EmptyView {
    init(title: String, subTitle: String? = nil, width: CGFloat = 200, button: @escaping () -> B) {
        self.init(
            title: title,
            subTitle: subTitle,
            width: width,
            button: button,
            additionalInfo: { EmptyView() }
        )
    }
}

extension Card where B == EmptyView, L == EmptyView {
    init(title: String, subTitle: String? = nil, width: CGFloat = 200) {
        self.init(
            title: title,
            subTitle: subTitle,
            width: width,
            button: {EmptyView()},
            additionalInfo: {EmptyView()}
        )
     }
}

protocol Composble {}

extension CFButton: Composble {}
extension EmptyView: Composble {}

extension Card {
    func textContainer() -> some View {
        VStack(alignment:.leading, spacing: 0) {
            Text(title)
                .systemFont(.subHeadline, weight: .bold)
            if let subTitle = subTitle {
                Text(subTitle)
                    .systemFont(.footnote)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        
        let myButton: CFButton = CFButton(label: "ww2", size: .small, type: .text, width: 80) {
            print("hello world!")
        }
        
        VStack {
            Card(title: "Hello")
            Card(title: "hello", width: 240, button: {
                myButton
            })
            Card(title: "Why", button: {
                myButton
            })
            Card(title: "eee", additionalInfo: {
                CFButton(label: "ww", size: .small, type: .text, width: 80) {
                    print("hh")
                }
            })
            Card(
                title: "World",
                subTitle: "GGG",
                 button: {
                CFButton(label: "ww", size: .small, type: .text, width: 80) {
                    print("hh")
                }
            })
        }
    }
}
