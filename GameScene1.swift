//
//  GameScene1.swift
//  LittleDream
//
//  Created by Valerie on 16.03.23.
//

import SpriteKit
import GameplayKit

class GameScene1: SKScene {
    
    override func didMove(to view: SKView) {
        let backgroundImage = SKSpriteNode(imageNamed: "backgroundAqua0")
        backgroundImage.position = CGPointMake(self.size.width/2, self.size.height/2)
        backgroundImage.size = CGSize(width: self.size.width, height: self.size.height)
        backgroundImage.zPosition = -1
        self.addChild(backgroundImage)
        
        
    }
    
    override func update(_ currentTime: CFTimeInterval) {
    
        let backgroundImage1 = SKSpriteNode(imageNamed: "backgroundAqua1")
        backgroundImage1.zPosition = 1
        backgroundImage1.position = CGPointMake(self.size.width/2, self.size.height/2)
        backgroundImage1.size = CGSize(width: self.size.width, height: self.size.height)
        backgroundImage1.alpha = 0.0
        addChild(backgroundImage1)
        
        let backgroundImage2 = SKSpriteNode(imageNamed:"backgroundAqua2")
        backgroundImage2.zPosition = 1
        backgroundImage2.position = CGPointMake(self.size.width/2, self.size.height/2)
        backgroundImage2.size = CGSize(width: self.size.width, height: self.size.height)
        backgroundImage2.alpha = 0.0
        addChild(backgroundImage2)
        backgroundImage2.run(SKAction.fadeIn(withDuration: 80.0))
        
        
        run(SKAction.sequence([backgroundImage1.run(SKAction.fadeIn(withDuration: 80.0)), backgroundImage2.run(SKAction.fadeIn(withDuration: 80.0)), backgroundImage2.run(SKAction.fadeOut(withDuration: 80.0)), backgroundImage1.run(SKAction.fadeOut(withDuration: 80.0))]))
    }
    
    func run(_ fileName: String){
                run(SKAction.playSoundFileNamed(fileName, waitForCompletion: true))
    }
    
    
}
