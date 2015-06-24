//
//  GameScene.swift
//  FrostyByte
//
//  Created by Shannon Armon on 6/24/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    
    var snowman: SKSpriteNode!

    override func didMoveToView(view: SKView) {
        
        snowman = childNodeWithName("snowman") as! SKSpriteNode
        
        buildLayout(stageLayout)
      
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
       
        let snowmanHead =  SKShapeNode(ellipseOfSize: CGSizeMake(30, 30))
        
            snowmanHead.fillColor = UIColor.whiteColor()
        
            snowmanHead.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        
            snowmanHead.physicsBody?.mass = 0.4
        
            snowmanHead.position = CGPointMake(200, 100)
        
            addChild(snowmanHead)
        
        snowmanHead.physicsBody?.applyImpulse(CGVectorMake(500, 300))
        
    }
    
    func buildLayout(layout: [Block]) {
        
        let gridSize: CGFloat = 20
        let gridMetric = (frame.width / 2) / gridSize
    
        for block in layout {
            
            let size = CGSizeMake(block.wide * gridMetric, block.tall * gridMetric)
        
            let blockNode = SKShapeNode(rectOfSize: size, cornerRadius: 4)
            
            let x = (block.left * gridMetric) + (size.width / 2) + (frame.width / 2)
            let y = (block.bottom * gridMetric) + (size.height / 2) + 20
            
            blockNode.position = CGPointMake(x,y)
            blockNode.fillColor = UIColor.blueColor()
            blockNode.strokeColor = UIColor.clearColor()
            
            blockNode.physicsBody = SKPhysicsBody(rectangleOfSize: size)
            
            addChild(blockNode)
           
        }
        
    
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}


struct Block {

    var left: CGFloat!
    var bottom: CGFloat!
    var wide: CGFloat!
    var tall: CGFloat!
    
    init(left l: CGFloat, botom b: CGFloat, wide w: CGFloat, tall t: CGFloat) {
    
        left = l
        bottom  = b
        wide = w
        tall = t
    
    }


}

let stageLayout: [Block] = [

    Block(left: 5, botom: 0, wide: 1, tall: 3),
    Block(left: 7, botom: 0, wide: 1, tall: 3),
    Block(left: 10, botom: 0, wide: 1, tall: 3),
    Block(left: 12, botom: 0, wide: 1, tall: 3),

    Block(left: 5, botom: 3, wide: 3, tall: 1),
    Block(left: 10, botom: 3, wide: 3, tall: 1),
    
    Block(left: 6, botom: 4, wide: 1, tall: 3),
    Block(left: 11, botom: 4, wide: 1, tall: 3),
    
    Block(left: 6, botom: 7, wide: 6, tall: 1),
    
    Block(left: 8, botom: 8, wide: 2, tall: 3),
    
    Block(left: 5, botom: 11, wide: 8, tall: 1),
    
    Block(left: 5, botom: 12, wide: 1, tall: 3),
    Block(left: 12, botom: 12, wide: 1, tall: 3)

]

//let stageLayout: [[String:AnyObject]] = [
//    
//        [
//
//            "left": 5,
//            "bottom" : 0,
//            "wide" : 1,
//            "tall" : 3
//    ]
//
//]
