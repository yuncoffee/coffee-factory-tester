//
//  CommonStyle.swift
//  coffee-factory-tester
//
//  Created by Yun Dongbeom on 2023/09/03.
//

import Foundation

struct ComponentStyle {
    var outlineStyle: ComponentOutlineStyle
    var fillStyle: ComponentFillStyle
    
    enum ComponentFillStyle: Int, CaseIterable {
        case fill
        case line
        case ghost
        case text
    }
    
    enum ComponentOutlineStyle: Int, CaseIterable {
        case round
        case block
        case box
        case text
    }
}

extension ComponentStyle.ComponentFillStyle {
    func isLook(_ style: ComponentStyle.ComponentFillStyle) -> Bool {
        self == style
    }
}

extension ComponentStyle.ComponentOutlineStyle {
    func isLook(_ style: ComponentStyle.ComponentOutlineStyle) -> Bool {
        self == style
    }
}

protocol StyleEssential {
    associatedtype CompoentType
    associatedtype CompoentSize
    associatedtype CompoentColor

    var size: CompoentSize { get }
    var type: CompoentType { get }
    var color: CompoentColor { get }
}

protocol StyleConfiguration: StyleEssential {
    associatedtype ConfigurationType
    var configuration: ConfigurationType { get }
}
