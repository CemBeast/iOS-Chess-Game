//
//  Utils.swift
//  ChessGameApp
//
//  Created by Cem Beyenal on 2/12/26.
//

import SwiftUI


enum Team {
    case white
    case black
    
    var opponent: Team {
        switch self {
        case .white:
            return .black
        case .black:
            return .white
        }
    }
    
    var color: Color {
        switch self {
        case .white:
            return .white
        case .black:
            return .black
        }
    }
}

extension Team : CustomStringConvertible {
    
    var description: String {
        switch self {
        case .white:
            return "white"
        case .black:
            return "black"
        }
    }
}

protocol ArtificialIntelligence {
    
    var name: String {get}
    
    // calculate next move
    
    
}

enum Player {
    case human
    case AI(ArtificialIntelligence)
}

extension Player: CustomStringConvertible {
    
    var description: String{
        switch self {
        case .human:
            return "Human"
        case .AI(let artificialIntelligence):
            return artificialIntelligence.name
        }
    }
    
}
