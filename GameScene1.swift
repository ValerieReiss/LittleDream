//
//  GameScene1.swift
//  LittleDream
//
//  Created by Valerie on 16.03.23.
//

import SpriteKit
import GameplayKit

class GameScene1: SKScene {

    private var magicStick : SKEmitterNode?
    
    override func didMove(to view: SKView) {
        
        self.magicStick = SKEmitterNode(fileNamed: "MyParticle.sks")
        if let magicStick = self.magicStick {
            magicStick.particleTexture = SKTexture(imageNamed: "magicstick.png")
            magicStick.setScale(4.0)
            magicStick.zPosition = 20
            magicStick.run(SKAction.sequence([SKAction.fadeOut(withDuration: 0.5), SKAction.removeFromParent()]))
        }
        
        CGPointMake(0.5, 0.5)
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
        backgroundImage2.zPosition = 2
        backgroundImage2.position = CGPointMake(self.size.width/2, self.size.height/2)
        backgroundImage2.size = CGSize(width: self.size.width, height: self.size.height)
        backgroundImage2.alpha = 0.0
        addChild(backgroundImage2)
        
        let backgroundImage3 = SKSpriteNode(imageNamed:"backgroundFlash")
        backgroundImage3.zPosition = 3
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
        
        
        //forground
        let seegras = SKSpriteNode(imageNamed: "seegras.png")
        seegras.zPosition = 4
        seegras.position = CGPoint(x: 300, y: 50)
        seegras.setScale(3)
        addChild(seegras)
        //forground castle
        let seegrasSchloss = SKSpriteNode(imageNamed: "seegrasSchloss.png")
        seegrasSchloss.zPosition = 10
        seegrasSchloss.position = CGPoint(x: 2300, y: 500)
        seegrasSchloss.alpha = 0.8
        seegrasSchloss.setScale(4)
        addChild(seegrasSchloss)
        
        
        //Bubbles
        if let bubbles = SKEmitterNode(fileNamed: "Bubbles"){
            bubbles.position = CGPoint (x: 500, y: -50)
            bubbles.advanceSimulationTime(10)
            bubbles.zPosition = 5
            addChild(bubbles)
            }
        
        //Medusa
        if let medusa = SKEmitterNode(fileNamed: "particleMedusa"){
            medusa.position = CGPoint (x: 500, y: -50)
            medusa.advanceSimulationTime(10)
            medusa.zPosition = 5
            addChild(medusa)
        }
        
        //Seepferd
        if let seepferd = SKEmitterNode(fileNamed: "particleSeepferd"){
            seepferd.position = CGPoint (x: 2100, y: -50)
            seepferd.advanceSimulationTime(10)
            seepferd.zPosition = 5
            addChild(seepferd)
        }
        
        //Turtle
        if let turtle = SKEmitterNode(fileNamed: "particleTurtle"){
            turtle.position = CGPoint (x: 0, y: 200)
            turtle.advanceSimulationTime(10)
            turtle.zPosition = 4
            addChild(turtle)
        }
        
        
        //Mermaid1
        let mermaidArray = ["mermaid0", "mermaid1", "mermaid2"]
        
        if let mermaid0 = SKEmitterNode(fileNamed: "particleMermaid"){
            //mermaid1.particleBirthRate = 0.07
            mermaid0.particleTexture = SKTexture(imageNamed: mermaidArray[0])
            mermaid0.position = CGPoint(x: 0, y: Int.random(in: 860..<960))
            mermaid0.advanceSimulationTime(10)
            mermaid0.zPosition = 5
            addChild(mermaid0)
        }
        if let mermaid1 = SKEmitterNode(fileNamed: "particleMermaid"){
            mermaid1.emissionAngle = 184
            mermaid1.xAcceleration = -10
            //mermaid1.particleBirthRate = 0.07
            mermaid1.particleTexture = SKTexture(imageNamed: mermaidArray[1])
            mermaid1.position = CGPoint(x: 2500, y: Int.random(in: 150..<250))
            mermaid1.advanceSimulationTime(10)
            mermaid1.zPosition = 5
            addChild(mermaid1)
        }
        if let mermaid2 = SKEmitterNode(fileNamed: "particleMermaid"){
            mermaid2.emissionAngle = 184
            mermaid2.xAcceleration = -10
            //mermaid1.particleBirthRate = 0.07
            mermaid2.particleTexture = SKTexture(imageNamed: mermaidArray[2])
            mermaid2.position = CGPoint(x: 2500, y: Int.random(in: 300..<500))
            mermaid2.advanceSimulationTime(10)
            mermaid2.zPosition = 5
            addChild(mermaid2)
        }
        
    
        //FATFISH from left
        
        let fatFishArray = ["fish1", "fish2", "fish3", "fish4", "fish5", "fish6", "fish8"]
        if let particles0 = SKEmitterNode(fileNamed: "particleFatFish"){
                particles0.particleBirthRate = 0.02
                particles0.particleTexture = SKTexture(imageNamed: fatFishArray[0])
                particles0.position = CGPoint (x: 0, y: Int.random(in: 760..<860))
                particles0.advanceSimulationTime(10)
                particles0.zPosition = 5
                addChild(particles0)
        }
        if let particles1 = SKEmitterNode(fileNamed: "particleFatFish"){
                particles1.particleBirthRate = 0.065
                particles1.particleTexture = SKTexture(imageNamed: fatFishArray[1])
                particles1.position = CGPoint (x: 0, y: Int.random(in: 900..<1100))
                particles1.advanceSimulationTime(10)
                particles1.zPosition = 5
                addChild(particles1)
        }
        if let particles2 = SKEmitterNode(fileNamed: "particleFatFish"){
                particles2.particleBirthRate = 0.01
                particles2.particleTexture = SKTexture(imageNamed: fatFishArray[2])
                particles2.position = CGPoint (x: 0, y: Int.random(in: 500..<600))
                particles2.advanceSimulationTime(10)
                particles2.zPosition = 5
                addChild(particles2)
        }
        if let particles3 = SKEmitterNode(fileNamed: "particleFatFish"){
                particles3.particleTexture = SKTexture(imageNamed: fatFishArray[3])
                particles3.position = CGPoint (x: 0, y: Int.random(in: 300..<400))
                particles3.advanceSimulationTime(10)
                particles3.zPosition = 5
                addChild(particles3)
        }
        if let particles4 = SKEmitterNode(fileNamed: "particleFatFish"){
                particles4.particleTexture = SKTexture(imageNamed: fatFishArray[4])
                particles4.position = CGPoint (x: 0, y: Int.random(in: 200..<300))
                particles4.advanceSimulationTime(10)
                particles4.zPosition = 5
                addChild(particles4)
        }
        if let particles5 = SKEmitterNode(fileNamed: "particleFatFish"){
                particles5.particleTexture = SKTexture(imageNamed: fatFishArray[5])
                particles5.position = CGPoint (x: 0, y: Int.random(in: 400..<500))
                particles5.advanceSimulationTime(10)
                particles5.zPosition = 5
                addChild(particles5)
        }
        if let particles6 = SKEmitterNode(fileNamed: "particleFatFish"){
                particles6.particleBirthRate = 0.07
                particles6.particleTexture = SKTexture(imageNamed: fatFishArray[6])
            particles6.setScale(0.8)
                particles6.position = CGPoint (x: 0, y: Int.random(in: 150..<250))
                particles6.advanceSimulationTime(10)
                particles6.zPosition = 5
                addChild(particles6)
        }
        
        
        //little swarm Fishes
        let swarmArray = ["particleSwarmfish", "particleSwarmfish1", "particleSwarmfish2", "particleSwarmfish3", "particleSwarmfish4"]
        
        if let swarm0 = SKEmitterNode(fileNamed: "particleSwarmfish"){
            swarm0.particleBirthRate = 0.5
            swarm0.particleTexture = SKTexture(imageNamed: swarmArray[2])
            swarm0.position = CGPoint (x: 0, y: Int.random(in: 1000..<1200))
            swarm0.advanceSimulationTime(10)
            swarm0.zPosition = 3
            addChild(swarm0)
        }
        if let swarm1 = SKEmitterNode(fileNamed: "particleSwarmfish"){
            swarm1.particleTexture = SKTexture(imageNamed: swarmArray[1])
            swarm1.position = CGPoint (x: 0, y: Int.random(in: 800..<900))
            swarm1.advanceSimulationTime(10)
            swarm1.zPosition = 3
            addChild(swarm1)
        }
        if let swarm2 = SKEmitterNode(fileNamed: "particleSwarmfish"){
            swarm2.particleTexture = SKTexture(imageNamed: swarmArray[3])
            swarm2.position = CGPoint (x: 0, y: Int.random(in: 700..<800))
            swarm2.advanceSimulationTime(10)
            swarm2.zPosition = 3
            addChild(swarm2)
        }
        if let swarm3 = SKEmitterNode(fileNamed: "particleSwarmfish"){
            swarm3.particleTexture = SKTexture(imageNamed: swarmArray[4])
            swarm3.position = CGPoint (x: 0, y: Int.random(in: 500..<600))
            swarm3.advanceSimulationTime(10)
            swarm3.zPosition = 3
            addChild(swarm3)
        }
        if let swarm4 = SKEmitterNode(fileNamed: "particleSwarmfish"){
            swarm4.particleBirthRate = 0.5
            swarm4.particleTexture = SKTexture(imageNamed: swarmArray[0])
            swarm4.position = CGPoint (x: 0, y: Int.random(in: 100..<200))
            swarm4.advanceSimulationTime(10)
            swarm4.zPosition = 3
            addChild(swarm4)
        }
        
    }

    override func update(_ currentTime: CFTimeInterval) { }
   
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.magicStick?.copy() as! SKEmitterNode? {
            n.position = pos
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.magicStick?.copy() as! SKEmitterNode? {
            n.position = pos
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.magicStick?.copy() as! SKEmitterNode? {
            n.position = pos
            self.addChild(n)
        }
    }
    
    func run(_ fileName: String){
                run(SKAction.playSoundFileNamed(fileName, waitForCompletion: true))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
}
