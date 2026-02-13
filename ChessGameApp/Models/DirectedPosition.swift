//
//  DirectedPosition.swift
//  ChessGameApp
//
//  Created by Cem Beyenal on 2/12/26.
//

import Foundation


struct DirectedPosition {
   
    let position: Position
    let perspective: Team
    
    
    func allSpaces(calculateNextPosition: (DirectedPosition) -> DirectedPosition?) -> [DirectedPosition]{
        
        var res = [DirectedPosition]()
        var current = self
        
        while let nextPosition = calculateNextPosition(current) {
            res.append(nextPosition)
            current = nextPosition
        }
        
        return res
    }
    
    // farthest position in front of piece
    var front: DirectedPosition? {
        
        guard let newRow = Row(rawValue: perspective == .white ? position.row.rawValue + 1: position.row.rawValue - 1) else {
            return nil
        }
        
        let newPosition = Position(rank: position.rank, row: newRow)
        return DirectedPosition(position: newPosition, perspective: perspective)
        
    }
    
    var back: DirectedPosition? {
        
        guard let newRow = Row(rawValue: perspective == .white ? position.row.rawValue - 1: position.row.rawValue + 1) else {
            return nil
        }
        
        let newPosition = Position(rank: position.rank, row: newRow)
        return DirectedPosition(position: newPosition, perspective: perspective)
        
    }
    
    var right: DirectedPosition? {
        
        guard let newRank = Rank(rawValue: perspective == .white ? position.rank.rawValue + 1 : position.rank.rawValue - 1) else {
            return nil
        }
        
        let newPosition = Position(rank: newRank, row: position.row)
        return DirectedPosition(position: newPosition, perspective: perspective)
        
    }
    
    var left: DirectedPosition? {
        
        guard let newRank = Rank(rawValue: perspective == .white ? position.rank.rawValue - 1 : position.rank.rawValue + 1) else {
            return nil
        }
        
        let newPosition = Position(rank: newRank, row: position.row)
        return DirectedPosition(position: newPosition, perspective: perspective)
        
    }
    
    var diagonalLeftFront: DirectedPosition? {
        
        return self
            .front?
            .left
        
    }
    
    var diagonalRightFront: DirectedPosition? {
        
        return self
            .front?
            .right
        
    }
    
    var diagonalLeftBack: DirectedPosition? {
        
        return self
            .back?
            .left
        
    }
    
    var diagonalRightBack: DirectedPosition? {
        
        return self
            .back?
            .right
        
    }
    
    var frontSpaces: [DirectedPosition] {
        return allSpaces { position in
            position.front
        }
    }
    
    var backSpaces: [DirectedPosition] {
        return allSpaces { position in
            position.back
        }
    }
    
    var leftSpaces: [DirectedPosition] {
        return allSpaces { position in
            position.left
        }
    }
    
    var rightSpaces: [DirectedPosition] {
        return allSpaces { position in
            position.right
        }
    }
    
    var diagonalLeftFrontSpaces: [DirectedPosition] {
        return allSpaces { position in
            position.diagonalLeftFront
        }
    }
    
    var diagonalRightFrontSpaces: [DirectedPosition] {
        return allSpaces { position in
            position.diagonalRightFront
        }
    }
    
    var diagonalLeftBackSpaces: [DirectedPosition] {
        return allSpaces { position in
            position.diagonalLeftBack
        }
    }
    
    var diagonalRightBackSpaces: [DirectedPosition] {
        return allSpaces { position in
            position.diagonalRightBack
        }
    }
    
}
