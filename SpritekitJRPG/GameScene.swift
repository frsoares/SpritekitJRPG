//
//  GameScene.swift
//  SpritekitJRPG
//
//  Created by Francisco Soares on 10/6/15.
//  Copyright (c) 2015 frsoares. All rights reserved.
//

import SpriteKit

import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var shipNode : SKNode!
    
    var movimentoPersonagem : CMMotionManager = CMMotionManager()
    
    var sideWays : Bool = true
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
       
        shipNode = self.childNodeWithName("sknodeShip")
                
        self.physicsWorld.contactDelegate=self
        
        
        let cameraNode = SKCameraNode()
        
        
        self.addChild(cameraNode)
        self.camera = cameraNode
        
        movimentoPersonagem.startAccelerometerUpdates()
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        print("begin contact")
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        print("Ended contact")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        
        shipNode.physicsBody?.velocity=CGVector.zero
        sideWays = !sideWays
//        guard let touch = touches.first else {
//            return
//        }
//
//        shipNode.runAction(SKAction.moveTo(touch.locationInNode(self), duration: 10.0))
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        movimentarPersonagem(currentTime)
        
        self.camera?.position = shipNode.position
        
        
    }
    
    func movimentarPersonagem(currentTime:CFTimeInterval){
        if let data = movimentoPersonagem.accelerometerData{
            if(fabs(data.acceleration.y) > 0.25){
                
                if(sideWays){
                    shipNode.physicsBody!.applyImpulse(CGVectorMake(-20.0 * CGFloat(data.acceleration.y), 0))
                }else{
                    shipNode.physicsBody!.applyImpulse(CGVectorMake(0, -20.0 * CGFloat(data.acceleration.y)))
                }
            }

//            print("x is \(data.acceleration.x)")
//            if(fabs(data.acceleration.x) > 0.25){
//                shipNode.physicsBody!.applyImpulse(CGVectorMake(0, -20.0 * CGFloat(data.acceleration.x)))
//
//            }
        }
    }
    
}
