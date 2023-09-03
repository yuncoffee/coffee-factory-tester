//
//  TestCard.swift
//  coffee-factory-tester
//
//  Created by Yun Dongbeom on 2023/09/04.
//

import SwiftUI

struct TestCard: View {
    var title: String = "Card Title"
    var subTitle: String? = nil
    var width: CGFloat = 200
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
//            ZStack(alignment: .topTrailing) {
//                Image("sample")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(
//                        width: width,
//                        height: width / 16 * 9,
//                        alignment: .bottom
//                    )
//                    .clipped()
//                CFLabel(label: "ff")
//                    .offset(x: -.CFSpacing.small, y:.CFSpacing.small)
//            }
            VStack {
                HStack(spacing: .CFSpacing.xsmall) {
                    textContainer()
                    CFButton(label: "Test") {
                        action()
                    }
                }
                .padding(.CFSpacing.xsmall)
            }
        }
        .background(Color.systemWhite)
        .frame(width: width)
        .border(.red, width: 2)
    }
}

extension TestCard {
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

struct TestCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            TestCard {
                print("Print!!")
            }
            TestCard {
                print("Print!!")
            }
        }
        
    }
}
