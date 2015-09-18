//
//  GameScene.swift
//  SeptemberEighteen
//
//  Created by Luis Reisewitz on 18.09.15.
//  Copyright (c) 2015 ZweiGraf. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        createWalls()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func createWalls() {
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
    }
}
