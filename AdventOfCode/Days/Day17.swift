//
//  Day17.swift
//  AdventOfCode
//

import Foundation

final class Day17: Day {
    
    static var targetX = (81, 129)
    static var targetY = (-150, -108)

    func simulateSteps(xVelocity: Int, yVelocity: Int) -> Int? {
        var resX = 0
        var resY = 0
        var simulationXVelocity = xVelocity
        var simulationYVelocity = yVelocity
        var heights = [Int]()
        while true  {
            resX += simulationXVelocity
            resY += simulationYVelocity
            if simulationXVelocity > 0 {
                simulationXVelocity -= 1
            } else if simulationXVelocity < 0 {
                simulationXVelocity += 1
            }
            if resY < Day17.targetY.0 {
                return nil
            }
            if resX >= Day17.targetX.0 && resX <= Day17.targetX.1 && resY >= Day17.targetY.0 && resY <= Day17.targetY.1 {
                simulationYVelocity -= 1
                heights.append(resY)
                print(xVelocity, yVelocity)
                return heights.max()
                }
            else {
                heights.append(resY)
                simulationYVelocity -= 1
            }
        }
    }
    
    func part1(_ input: String) -> CustomStringConvertible {
        var yVelocity = 0
        var xVelocity = 0
        var result: Int? = nil
        
        var maxHeight = Int.min
        
        for i in 0..<1000 {
            for j in 0..<1000 {
                xVelocity = i
                yVelocity = j
                result = simulateSteps(xVelocity: xVelocity, yVelocity: yVelocity)
                if let result = result {
                    if result > maxHeight {
                        maxHeight = result
                    }
                }
            }
        }
        return maxHeight
    }

    func part2(_ input: String) -> CustomStringConvertible {
        return 0
    }
}
