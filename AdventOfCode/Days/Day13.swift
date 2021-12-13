//
//  Day13.swift
//  AdventOfCode
//

import Foundation

final class Day13: Day {
    
    struct Coordinate: Hashable {
        let x: Int
        let y: Int
    }
    
    func fold(over val: Int, set: Set<Coordinate>) -> Set<Coordinate> {
        var folded: Set<Coordinate> = []
        for coord in set {
            if coord.x > val {
                assert(2*val - coord.x >= 0)
                folded.insert(Coordinate(x: 2*val - coord.x, y: coord.y))
            } else if coord.x < val {
                folded.insert(Coordinate(x: coord.x, y: coord.y))
            }
        }
        
        return folded
    }
    
    func part1(_ input: String) -> CustomStringConvertible {
        let parsedInput = input
            .lines
        
        let point = parsedInput
            .firstIndex { line in
                line.starts(with: "f")
            }
        
        let coordinates = parsedInput[0..<point!]
            .map { coord -> (Int, Int) in
                let string = coord.split(separator: ",")
                return (Int(String(string[0]))!, Int(String(string[1]))!)
            }
        let commands = parsedInput[point!..<parsedInput.count]
        
        var hashtagSet: Set<Coordinate> = []
        
        for coordinate in coordinates {
            hashtagSet.insert(Coordinate(x: coordinate.0, y: coordinate.1))
        }
        
        let folded = fold(over: 655, set: hashtagSet)
        
        return folded
    }

    func part2(_ input: String) -> CustomStringConvertible {
        return 0
    }
}
