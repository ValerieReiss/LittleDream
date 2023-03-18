//
//  GameScene.swift
//  LittleDream
//
//  Created by Valerie on 16.03.23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        //CGPointMake(0.5, 0.5)
        
        let backgroundImage = SKSpriteNode(imageNamed: "backgroundImage")
        backgroundImage.position = .zero
        backgroundImage.size = CGSize(width: self.size.width, height: self.size.height)
        backgroundImage.zPosition = -1
        backgroundImage.name = "button0"
        self.addChild(backgroundImage)
               
        //let fadeOut = SKAction.fadeAlpha(to: 0.0, duration: 2.0)
        //let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: 2.0)
        
        let button0 = SKSpriteNode(imageNamed: "button0.jpg")
        button0.name = "button0"
        button0.setScale(1.0)
        button0.position = .zero
        button0.zPosition = 20
        button0.alpha = 0.0
        addChild(button0)
        button0.run(SKAction.fadeIn(withDuration: 2.0))
       
        
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.name = "button0"
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let location = touch.location(in: self)
            let nodeTouched = atPoint(location)
            if nodeTouched.name == "button0" {
                print("touched")
                self.view?.presentScene(GameScene1(size: self.size),
                                        transition: .crossFade(withDuration: 2))
                run("sound-button")
            } /*else if nodeTouched.name == "button1" {
                self.view?.presentScene(GameScene2(size: self.size),
                                        transition: .crossFade(withDuration: 2))
                run("sound-button")*/
            }
        }
    
    func run(_ fileName: String){
                run(SKAction.playSoundFileNamed(fileName, waitForCompletion: true))
    }
}
