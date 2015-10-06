//
//  GameScene.swift
//  SpritekitJRPG
//
//  Created by Francisco Soares on 10/6/15.
//  Copyright (c) 2015 frsoares. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var shipNode : SKNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
       
        shipNode = self.childNodeWithName("sknodeShip")
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        
        shipNode.runAction(SKAction.rotateByAngle(CGFloat(2*M_PI), duration: 2.0))
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
