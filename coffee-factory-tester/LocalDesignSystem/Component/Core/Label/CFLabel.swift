//
//  Label.swift
//  coffee-factory-tester
//
//  Created by Yun Dongbeom on 2023/09/03.
//

import SwiftUI


protocol StyledLabelStyleEssential {
    var alignStyle: LabelAlignStyle { get }
}

struct CFLabel: View, StyleEssential, StyledLabelStyleEssential {
    var label: String
    var icon: String = "plus.square.fill"
    var type: LabelType = .blockFill
    var size: LabelSize = .small
    var color: Color = .CFSecondary.orange
    var fontStyle: FoundationTypoSystemFont = .footnote
    var alignStyle: LabelAlignStyle = .textOnly

    var body: some View {
        Label(label, systemImage: icon)
            .labelStyle(CFLabelStyle(
                type: type,
                size: size,
                color: color,
                alignStyle: alignStyle
            )
        )
        .systemFont(fontStyle)
    }
}

struct CFLabel_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Group {
                CFLabel(label: "Hello World", alignStyle: .textOnly)
                CFLabel(label: "Hello World", size: .xsmall, alignStyle: .iconOnly)
                CFLabel(label: "Hello World", size: .small, alignStyle: .iconOnly)
                CFLabel(label: "Hello World", size: .medium, alignStyle: .iconOnly)
                CFLabel(label: "Hello World", size: .large, alignStyle: .iconOnly)
                CFLabel(label: "Hello World", size: .xlarge, alignStyle: .iconOnly)
                CFLabel(label: "Hello World", alignStyle: .iconOnly)
                CFLabel(label: "Hello World", alignStyle: .iconWithText)
                CFLabel(label: "Hello World2", alignStyle: .textWithIcon)
                CFLabel(label: "Hello World", alignStyle: .iconWithTextVertical)
            }
            Group {
                CFLabel(label: "Hello", size: .xsmall, alignStyle: .textOnly)
                CFLabel(label: "Hello", size: .small, alignStyle: .textOnly)
                CFLabel(label: "Hello", size: .medium, alignStyle: .textOnly)
                CFLabel(label: "Hello", size: .large, alignStyle: .textOnly)
                CFLabel(label: "Hello", size: .xlarge, alignStyle: .textOnly)
            }
        }
        
    }
}

enum LabelAlignStyle {
    case iconWithText
    case textWithIcon
    case iconOnly
    case textOnly
    case iconWithTextVertical
}

enum LabelType {
    case blockFill
    case blockLine
    case boxFill
    case boxLine
    case roundFill
    case roundLine
    case text
    case none
}

enum LabelSize {
    case xsmall
    case small
    case medium
    case large
    case xlarge
}

extension LabelType {
    var style: ComponentStyle? {
        switch self {
        case .blockFill:
            return ComponentStyle(outlineStyle: .block, fillStyle: .fill)
        case .blockLine:
            return ComponentStyle(outlineStyle: .block, fillStyle: .line)
        case .boxFill:
            return ComponentStyle(outlineStyle: .box, fillStyle: .fill)
        case .boxLine:
            return ComponentStyle(outlineStyle: .box, fillStyle: .line)
        case .roundFill:
            return ComponentStyle(outlineStyle: .round, fillStyle: .fill)
        case .roundLine:
            return ComponentStyle(outlineStyle: .round, fillStyle: .line)
        case .text:
            return ComponentStyle(outlineStyle: .text, fillStyle: .text)
        case .none:
            return nil
        }
    }
}

extension LabelSize {
    var rawValue: CGFloat {
        switch self {
        case .xsmall:
            return 18
        case .small:
            return 20
        case .medium:
            return 26
        case .large:
            return 28
        case .xlarge:
            return 32
        }
    }
}

struct CFLabelStyle: LabelStyle, StyleEssential, StyledLabelStyleEssential {
    var type: LabelType
    var size: LabelSize
    var color: Color
    var alignStyle: LabelAlignStyle
    
    func makeBody(configuration: Configuration) -> some View {
        if type == .none {
            CFLabelContent(
                configuration: configuration,
                type: type,
                size: size,
                color: color,
                alignStyle: alignStyle
            )
            .foregroundColor(color)
            .frame(minHeight: size.rawValue)
        } else {
            if let style = type.style {
                CFLabelContent(
                    configuration: configuration,
                    type: type,
                    size: size,
                    color: color,
                    alignStyle: alignStyle
                )
                .padding(.horizontal, .CFSpacing.xsmall)
                .padding(.vertical, .CFSpacing.xxsmall)
                .frame(minWidth: size.rawValue * 1.5, minHeight: size.rawValue)
                .background(
                    style.fillStyle.isLook(.fill)
                    ? color
                    : .clear)
                .foregroundColor(
                    style.fillStyle.isLook(.fill)
                    ? .systemWhite
                    : color
                )
                .cornerRadius(style.outlineStyle.isLook(.block)
                              ? .CFCornerRadius.xsmall
                              : style.outlineStyle.isLook(.round)
                              ? .CFCornerRadius.round
                              : 0)
                .overlay(
                    RoundedRectangle(
                        cornerRadius: style.outlineStyle.isLook(.block)
                        ? .CFCornerRadius.xsmall
                        : style.outlineStyle.isLook(.round)
                        ? .CFCornerRadius.round
                        : 0)
                    .stroke(
                        style.fillStyle.isLook(.text)
                        ? .clear
                        : color, lineWidth: 3)
                    .cornerRadius(style.outlineStyle.isLook(.block)
                                  ? .CFCornerRadius.xsmall
                                  : style.outlineStyle.isLook(.round)
                                  ? .CFCornerRadius.round
                                  : 0)
                )
            }
        }
    }
}

struct CFLabelContent: View, StyleConfiguration, StyledLabelStyleEssential {
    var configuration: LabelStyleConfiguration
    var type: LabelType
    var size: LabelSize
    var color: Color
    var alignStyle: LabelAlignStyle
    
    var body: some View {
        if alignStyle == .iconWithTextVertical {
            VStack(spacing: .CFCompoentSpacing.small) {
                configuration.icon
                configuration.title
            }
        } else if alignStyle == .iconOnly {
            configuration.icon
        } else if alignStyle == .textWithIcon {
            HStack(spacing: .CFCompoentSpacing.small) {
                configuration.title
                configuration.icon
            }
        } else if alignStyle == .iconWithText {
            HStack(spacing: .CFCompoentSpacing.small) {
                configuration.icon
                configuration.title
            }
        } else {
            configuration.title
        }
    }
}
