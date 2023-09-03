//
//  Button.swift
//  coffee-factory-tester
//
//  Created by Yun Dongbeom on 2023/09/03.
//

import SwiftUI

struct CFButton: View, StyleEssential, StyledLabelStyleEssential {
    var label: String
    var icon: String?
    var alignStyle: LabelAlignStyle = .textOnly
    var size: CFButtonSize = .medium
    var type: CFButtonType = .blockFill
    var color: Color = .CFPrimary.primary
    var width: CGFloat = .infinity
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            if let icon = icon {
                CFLabel(
                    label: label,
                    icon: icon,
                    type: .none,
                    color: type.style.fillStyle.isLook(.fill) ? .systemWhite : color,
                    fontStyle: size.font,
                    alignStyle: alignStyle
                )
                .systemFont(size.font, weight: .medium)
            } else {
                CFLabel(
                    label: label,
                    type: .none,
                    color: type.style.fillStyle.isLook(.fill) ? .systemWhite : color,
                    fontStyle: size.font,
                    alignStyle: alignStyle
                )
            }
        }
        .buttonStyle(
            CFButtonStyle(
                size: size,
                type: type,
                color: color)
        )
        .frame(maxWidth: width)
    }
}

// MARK: - Preview
struct CFButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CFButton(label: "Hello") {
                print("Hello")
            }
            CFButton(
               label: "World!",
               size: .medium,
               type: .blockFill
                   
            ) {
                print("World!")
            }
            .frame(maxWidth: .infinity)
            .padding(.CFSpacing.medium)
        }
    }
}

enum CFButtonType {
    case blockFill
    case blockLine
    case blockGhost
    case boxFill
    case boxLine
    case boxGhost
    case roundFill
    case roundLine
    case roundGhost
    case text
}

enum CFButtonSize {
    case xsmall
    case small
    case medium
    case large
    case xlarge
}

extension CFButtonType {
    var style: ComponentStyle {
        switch self {
        case .blockFill:
            return ComponentStyle(outlineStyle: .block, fillStyle: .fill)
        case .blockLine:
            return ComponentStyle(outlineStyle: .block, fillStyle: .line)
        case .blockGhost:
            return ComponentStyle(outlineStyle: .block, fillStyle: .ghost)
        case .boxFill:
            return ComponentStyle(outlineStyle: .box, fillStyle: .fill)
        case .boxLine:
            return ComponentStyle(outlineStyle: .box, fillStyle: .line)
        case .boxGhost:
            return ComponentStyle(outlineStyle: .box, fillStyle: .ghost)
        case .roundFill:
            return ComponentStyle(outlineStyle: .round, fillStyle: .fill)
        case .roundLine:
            return ComponentStyle(outlineStyle: .round, fillStyle: .line)
        case .roundGhost:
            return ComponentStyle(outlineStyle: .round, fillStyle: .ghost)
        case .text:
            return ComponentStyle(outlineStyle: .text, fillStyle: .text)
        }
    }
}


extension CFButtonSize {
    var rawValue: CGFloat {
        switch self {
        case .xsmall:
            return FoundationSpaceFrame.xsmall.rawValue
        case .small:
            return FoundationSpaceFrame.small.rawValue
        case .medium:
            return FoundationSpaceFrame.medium.rawValue
        case .large:
            return FoundationSpaceFrame.large.rawValue
        case .xlarge:
            return FoundationSpaceFrame.xlarge.rawValue
        }
    }
    
    var font: FoundationTypoSystemFont {
        switch self {
        case .xsmall:
            return .footnote
        case .small:
            return .footnote
        case .medium:
            return .footnote
        case .large:
            return .body
        case .xlarge:
            return .body
        }
    }
}

struct CFButtonStyle: ButtonStyle, StyleEssential {
    var size: CFButtonSize
    var type: CFButtonType
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        CFButtonContent(configuration: configuration, type: type, color: color, size: size)
    }
}

struct CFButtonContent: View, StyleConfiguration {
    var configuration: ButtonStyleConfiguration
    var type: CFButtonType
    var color: Color
    var size: CFButtonSize
    
    var body: some View {
        configuration.label
            .systemFont(size.font, weight: .medium)
            .multilineTextAlignment(.center)
            .padding(.horizontal, .CFSpacing.xsmall)
            .padding(.vertical, .CFSpacing.xxsmall)
            .frame(maxWidth: .infinity, minHeight: size.rawValue)
            .background(
                type.style.fillStyle.isLook(.fill)
                ? color
                : .clear)
            .foregroundColor(
                type.style.fillStyle.isLook(.fill)
                ? .systemWhite
                : color
            )
            .cornerRadius(type.style.outlineStyle.isLook(.block)
                          ? .CFCornerRadius.xsmall
                          : type.style.outlineStyle.isLook(.round)
                          ? .CFCornerRadius.round
                          : 0)
            .overlay(
                RoundedRectangle(
                    cornerRadius: type.style.outlineStyle.isLook(.block)
                    ? .CFCornerRadius.xsmall
                    : type.style.outlineStyle.isLook(.round)
                    ? .CFCornerRadius.round
                    : 0)
                .stroke(
                    type.style.fillStyle.isLook(.ghost) || type.style.fillStyle.isLook(.text)
                    ? .clear
                    : color, lineWidth: 3)
                .cornerRadius(type.style.outlineStyle.isLook(.block)
                              ? .CFCornerRadius.xsmall
                              : type.style.outlineStyle.isLook(.round)
                              ? .CFCornerRadius.round
                              : 0)
            )
    }
}
