//
//  GameScene1.swift
//  LittleDream
//
//  Created by Valerie on 16.03.23.
//

import SpriteKit
import GameplayKit

class GameScene1: SKScene {
    
    let swarms = Bundle.main.decode([Swarm].self, from: "swarms.json")
    let fishTypes = Bundle.main.decode([FishType].self, from: "fish-types.json")
    
    var swarmNumber = 0
    let positions = Array(stride(from: -320, through:320, by: 80))
    
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = .zero
        
        let backgroundImage = SKSpriteNode(imageNamed: "backgroundAqua1")
        backgroundImage.position = CGPointMake(self.size.width/2, self.size.height/2)
        backgroundImage.size = CGSize(width: self.size.width, height: self.size.height)
        backgroundImage.zPosition = -10
        self.addChild(backgroundImage)
        
        let backgroundImage1 = SKSpriteNode(imageNamed: "backgroundAqua1")
        backgroundImage1.zPosition = 1
        backgroundImage1.position = CGPointMake(self.size.width/2, self.size.height/2)
        backgroundImage1.size = CGSize(width: self.size.width, height: self.size.height)
        backgroundImage1.alpha = 0.0
        addChild(backgroundImage1)
        
        let backgroundImage2 = SKSpriteNode(imageNamed:"backgroundAqua2")
        backgroundImage2.zPosition = 3
        backgroundImage2.position = CGPointMake(self.size.width/2, self.size.height/2)
        backgroundImage2.size = CGSize(width: self.size.width, height: self.size.height)
        backgroundImage2.alpha = 0.0
        addChild(backgroundImage2)
        
        let backgroundImage3 = SKSpriteNode(imageNamed:"backgroundFlash")
        backgroundImage3.zPosition = 2
        backgroundImage3.position = CGPointMake(self.size.width/2, self.size.height/2)
        backgroundImage3.size = CGSize(width: self.size.width, height: self.size.height)
        backgroundImage3.alpha = 0.0
        addChild(backgroundImage3)
        
        
        let fadeIn = SKAction.fadeIn(withDuration: 3.0)
        let fadeOut = SKAction.fadeOut(withDuration: 3.0)
        let sequence = SKAction.sequence([fadeIn, fadeOut])
        let redo = SKAction.repeatForever(sequence)
        backgroundImage1.run(redo)
        
        let fadeIn2 = SKAction.fadeIn(withDuration: 4.0)
        let fadeOut2 = SKAction.fadeOut(withDuration: 4.0)
        let sequence2 = SKAction.sequence([fadeIn2, fadeOut2])
        let redo2 = SKAction.repeatForever(sequence2)
        backgroundImage2.run(redo2)
        
        let fadeIn3 = SKAction.fadeIn(withDuration: 5.0)
        let fadeOut3 = SKAction.fadeOut(withDuration: 5.0)
        let sequence3 = SKAction.sequence([fadeIn3, fadeOut3])
        let redo3 = SKAction.repeatForever(sequence3)
        backgroundImage3.run(redo3)
        
        
        
        
        
        //bubbles bubbles
        
        if let particles = SKEmitterNode(fileNamed: "Bubbles"){
                    particles.position = CGPoint (x: 300, y: 0)
                    particles.advanceSimulationTime(10)
                    particles.zPosition = 5
                    addChild(particles)
                }
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        for child in children {
                    if child.frame.maxX < 0 {
                        if !frame.intersects(child.frame){
                            child.removeFromParent()
                        }
                    }
                }
        let activeFishes = children.compactMap { $0 as? FishNode}
        if activeFishes.isEmpty {
            createSwarm()
        }

    }
    
    func createSwarm() {
            if swarmNumber == swarms.count {
                //levelNumber += 1
                swarmNumber = 0
            }
            
            let currentSwarm = swarms[swarmNumber]
            swarmNumber += 1
            
            //let maximumFishType = min(fishTypes.count, levelNumber + 1)
            let fishType = Int.random(in:0...2)
            
            let fishOffsetX = CGFloat(Int.random(in:0...100))
            let fishStartX = 2500
            
            if currentSwarm.fishes.isEmpty {
                for(index, position) in positions.shuffled().enumerated(){
                        let fish = FishNode(type: fishTypes[fishType], startPosition: CGPoint(x: fishStartX, y: position), xOffset: fishOffsetX * CGFloat(index * 2), moveStraight: true)
                        addChild(fish)
                }
            } else {
                for fish in currentSwarm.fishes{
                    let node = FishNode(type: fishTypes[fishType], startPosition: CGPoint(x: fishStartX, y: positions[fish.position]), xOffset: fishOffsetX, moveStraight: fish.moveStraight)
                    addChild(node)
                }
            }
        }

    
    
    
    
    
    func run(_ fileName: String){
                run(SKAction.playSoundFileNamed(fileName, waitForCompletion: true))
    }
    
    
}
