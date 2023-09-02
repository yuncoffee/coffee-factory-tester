//
//  Space.swift
//  coffee-factory-tester
//
//  Created by Yun Dongbeom on 2023/09/02.
//

import Foundation
import SwiftUI

extension CGFloat {
    static func cornerRadius(_ size: FoundationSpaceRaduis) -> CGFloat {
        size.rawValue
    }
    
    static func spacing(_ size: FoundationSpaceSpacing) -> CGFloat {
        size.rawValue
    }
    
    static func frame(_ size: FoundationSpaceFrame) -> CGFloat {
        size.rawValue
    }
}

enum FoundationSpaceRaduis: CGFloat {
    case xxsmall = 2.0
    case xsmall = 4.0
    case samll = 6.0
    case medium = 8.0
    case large = 12.0
    case xlarge = 16.0
    case xxlarge = 20.0
    case xxxlarge = 24.0
}

enum FoundationSpaceSpacing: CGFloat {
    case xxsmall = 4.0
    case xsmall = 8.0
    case samll = 12.0
    case medium = 16.0
    case large = 20.0
    case xlarge = 24.0
    case xxlarge = 32.0
    case xxxlarge = 40.0
}

enum FoundationSpaceFrame: CGFloat {
    case xxsmall = 24.0
    case xsmall = 28.0
    case samll = 32.0
    case medium = 36.0
    case large = 40.0
    case xlarge = 48.0
    case xxlarge = 54.0
}
