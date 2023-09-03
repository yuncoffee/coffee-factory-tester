//
//  StyledText.swift
//  coffee-factory-tester
//
//  Created by Yun Dongbeom on 2023/09/03.
//

import SwiftUI

struct StyledText: View {
    var content: Text
    var style: FoundationTypoSystemFont = .body
    var weight: FoundationTypoSystemFont.FontWeight? = nil
    var color: Color = .systemBlack
    
    var body: some View {
        content
            .systemFont(style, weight: weight)
            .foregroundColor(color)
            .multilineTextAlignment(.trailing)
    }
}

struct StyledText_Previews: PreviewProvider {
    static var previews: some View {
        StyledText(
            content: Text("Heee"),
            style: .title,
            weight: .regular,
            color: .CFPrimary.primary
        )
    }
}
