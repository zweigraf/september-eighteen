//
//  GameScene.swift
//  SeptemberEighteen
//
//  Created by Luis Reisewitz on 18.09.15.
//  Copyright (c) 2015 ZweiGraf. All rights reserved.
//

import SpriteKit
import AVFoundation

class GameScene: SKScene {
    let leftButton = SKLabelNode(text: "left")
    let rightButton = SKLabelNode(text: "right")
    let upButton = SKLabelNode(text: "up")
    let downButton = SKLabelNode(text: "down")

    override func didMoveToView(view: SKView) {
        createGrid()
        createWalls()
        
        let hero = self.childNodeWithName("hero")
        let herobody = hero?.physicsBody
        herobody?.affectedByGravity = false
        herobody?.restitution = 0.0
        herobody?.linearDamping = 0.0
        herobody?.angularDamping = 1.0
        self.listener = hero
        
        if let cameraNode = camera {
            createButtons(cameraNode)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let audioparent = SKSpriteNode(color: SKColor.greenColor(), size: CGSize(width: 50, height: 50))
            audioparent.position = location
            audioparent.physicsBody = SKPhysicsBody(rectangleOfSize: audioparent.frame.size)
            audioparent.physicsBody?.affectedByGravity = false
            let audioNode = SKAudioNode(fileNamed: "432.wav")
            audioNode.positional = true
            audioparent.addChild(audioNode)
            
            self.addChild(audioparent)
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func createWalls() {
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
    }
    
    func createGrid() {
        let rect = self.frame
        let grid = SKNode()
        grid.zPosition -= 1
        for var x = CGRectGetMinX(rect); x < CGRectGetMaxX(rect); x += 50 {
            let node = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: 5, height: CGRectGetHeight(rect)))
            node.position = CGPoint(x: x, y: CGRectGetMidY(rect))
            grid.addChild(node)
        }
        for var y = CGRectGetMinY(rect); y < CGRectGetMaxY(rect); y += 50 {
            let node = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: CGRectGetWidth(rect), height: 5))
            node.position = CGPoint(x: CGRectGetMidX(rect), y: y)
            grid.addChild(node)
        }
        
        self.addChild(grid)
    }
    
    func createButtons(camera: SKCameraNode) {
        leftButton.position = CGPoint(x: CGRectGetMinX(self.frame) + 20, y: CGRectGetMidY(self.frame))
        rightButton.position = CGPoint(x: CGRectGetMaxX(self.frame) - 20, y: CGRectGetMidY(self.frame))
        upButton.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame) - 20)
        downButton.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMinY(self.frame) + 20)
        
        camera.addChild(leftButton)
        camera.addChild(rightButton)
        camera.addChild(upButton)
        camera.addChild(downButton)
    }
}
