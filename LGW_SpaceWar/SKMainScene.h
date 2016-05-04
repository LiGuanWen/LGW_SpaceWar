//
//  SKMainScene.h
//  SpriteKit
//
//  Created by Lilong on 16/4/19.
//  Copyright © 2016年 第七代目. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKMainScene : SKScene<SKPhysicsContactDelegate>{
    
    int _smallPlaneTime;
    int _mediumPlaneTime;
    int _bigPlaneTime;
    NSString *_lastScore;
    
    int _adjustmentBackgroundPosition;
    
    SKLabelNode *_scoreLabel;
    SKSpriteNode *_playerPlane;
    SKSpriteNode *_background1;
    SKSpriteNode *_background2;

    SKAction *_smallFoePlaneHitAction;
    SKAction *_mediumFoePlaneHitAction;
    SKAction *_bigFoePlaneHitAction;
    SKAction *_smallFoePlaneBlowupAction;
    SKAction *_mediumFoePlaneBlowupAction;
    SKAction *_bigFoePlaneBlowupAction;
}

@end
