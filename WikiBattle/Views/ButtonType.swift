//
//  ButtonType.swift
//  WikiBattle
//  

import SwiftUI

enum ButtonType {
    case length
    case browse
    case next
}

extension ButtonType {
    
    var label: String {
        switch self {
            
        case .length:
            return "長い"
        case .browse:
            return "閲覧数が多い"
        case .next:
            return "次の問題へ"
        }
    }
    
    var color: Color {
        switch self {
            
        case .length:
            return .teal
        case .browse:
            return .green
        case .next:
            return .red
        }
    }
    
    var width: CGFloat {
        switch self {
            
        case .length, .browse:
            return 150
        case .next:
            return 300
        }
    }
    
    var height: CGFloat {
        switch self {
            
        case .length, .browse:
            return 40
        case .next:
            return 50
        }
    }
}
