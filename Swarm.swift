//
//  Swarm.swift
//  Balloonatics
//
//  Created by Valerie on 26.02.23.
//

import SpriteKit

struct Swarm: Codable{
    struct SwarmFish: Codable{
        let position = Int.random(in: 0..<6)
        let xOffset: CGFloat
        let moveStraight: Bool
    }
    
    let name: String
    let fishes: [SwarmFish]
}
