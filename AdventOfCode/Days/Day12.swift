//
//  Day12.swift
//  AdventOfCode
//

import Foundation

final class Day12: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        var dict: [String: [String]] = [:]
        input
            .lines
            .map { line in line.split(separator: "-") }
            .forEach { pair in
                if dict[String(pair[0])] != nil{
                    dict[String(pair[0])]!.append(String(pair[1]))
                } else {
                    dict[String(pair[0])] = [String(pair[1])]
                }
                if dict[String(pair[1])] != nil{
                    dict[String(pair[1])]!.append(String(pair[0]))
                } else {
                    dict[String(pair[1])] = [String(pair[0])]
                }
            }
        return dict
    }

    func part2(_ input: String) -> CustomStringConvertible {
        return 0
    }
}
