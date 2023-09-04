//
//  Card.swift
//  coffee-factory-tester
//
//  Created by Yun Dongbeom on 2023/09/03.
//

import SwiftUI

protocol CardButtonComposble {}
protocol CardLabelComposble {}

protocol Composble: CardButtonComposble, CardLabelComposble {}

extension CFButton: CardButtonComposble {}
extension CFLabel: CardLabelComposble {}
extension EmptyView: Composble {}

struct Card<B: View, L: View>: View where B: CardButtonComposble, L: CardLabelComposble {
    var title: String
    var subTitle: String? = nil
    var width: CGFloat
    var tintColor: Color = .systemBlack
    
    let image: () -> Image
    let button: () -> B?
    let additionalInfo: () -> L?
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topTrailing) {
                image()
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
        .frame(width: width)
    }
}

extension Card where B == EmptyView {
    init(title: String, subTitle: String? = nil, width: CGFloat = 200, tintColor: Color = .systemBlack, image: @escaping () -> Image, additionalInfo: @escaping () -> L) {
        self.init(
            title: title,
            subTitle: subTitle,
            width: width,
            tintColor: tintColor,
            image: image,
            button: { EmptyView() },
            additionalInfo: additionalInfo
        )
    }
}

extension Card where L == EmptyView {
    init(title: String, subTitle: String? = nil, width: CGFloat = 200, tintColor: Color = .systemBlack, image: @escaping () -> Image, button: @escaping () -> B) {
        self.init(
            title: title,
            subTitle: subTitle,
            width: width,
            tintColor: tintColor,
            image: image,
            button: button,
            additionalInfo: { EmptyView() }
        )
    }
}

extension Card where B == EmptyView, L == EmptyView {
    init(title: String, subTitle: String? = nil, width: CGFloat = 200, tintColor: Color = .systemBlack, image: @escaping () -> Image) {
        self.init(
            title: title,
            subTitle: subTitle,
            width: width,
            tintColor: tintColor,
            image: image,
            button: {EmptyView()},
            additionalInfo: {EmptyView()}
        )
     }
}


extension Card {
    func textContainer() -> some View {
        VStack(alignment:.leading, spacing: 0) {
            Text(title)
                .systemFont(.subHeadline, weight: .bold)
                .foregroundColor(tintColor)
            if let subTitle = subTitle {
                Text(subTitle)
                    .systemFont(.footnote)
                    .foregroundColor(tintColor)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        
        let myButton: CFButton = CFButton(label: "more", size: .small, type: .text, width: 80) {
            print("hello world!")
        }
        
        let myImage: Image = Image("sample")
        
        VStack {
            ScrollView {
                Card(title: "Hello", image: {
                    myImage
                })
                .cornerRadius(.CFCornerRadius.large)
                Card(title: "hello", width: 240, image: {
                    myImage
                }, button: {
                    myButton
                })
                Card(title: "Why", image: {
                    myImage
                }, button: {
                    myButton
                })
                Card(title: "eee", image: {myImage}, additionalInfo: {
                    CFLabel(label: "Hello")
                })
                Card(
                    title: "World",
                    subTitle: "GGG",
                    image: {myImage},
                     button: {
                    CFButton(label: "more Info", size: .small, type: .text, width: 80) {
                        print("more Info")
                    }
                })
                Card(title: "hello", width: 320) {
                    myImage
                } button: {
                    myButton
                } additionalInfo: {
                    CFLabel(label: "hello")
                }

                Card(title: "Hello World!", width: 200) {
                    Image("sample")
                } button: {
                    CFButton(label: "more Info", size: .small, type: .text, width: 80) {
                        print("hh")
                    }
                } additionalInfo: {
                    CFLabel(label: "hello")
                }
            }
        }
    }
}
