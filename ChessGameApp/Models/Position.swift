//
//  Position.swift
//  ChessGameApp
//
//  Created by Cem Beyenal on 2/12/26.
//

import Foundation

struct Position: Equatable {
    
    let rank: Rank
    let row: Row
    
    init(rank: Rank, row: Row) {
        self.rank = rank
        self.row = row
    }
    
    init?(gridIndex: IndexPath) {
        guard gridIndex != IndexPath(row: 8, column: 0) else {
            self = Position(rank: .A, row: .end)
            return
        }
        
        guard let row = Row(rawValue: 8 - gridIndex.row),
              let rank = Rank(rawValue: gridIndex.column + 1)
        else {
            return nil
        }
        
        self.rank = rank
        self.row = row
    }
    
    var gridIndex: IndexPath {
        
        let convertedRow = abs(row.rawValue - 8)
        let convertedRank = rank.rawValue - 1
        
        return IndexPath(row: convertedRow, column: convertedRank)
    }
    
}
