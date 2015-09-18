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
        createGrid()
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
}
