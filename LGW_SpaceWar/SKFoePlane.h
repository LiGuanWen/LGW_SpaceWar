//
//  SKFoePlane.h
//  SpriteKit
//
//  Created by Lilong on 16/4/19.
//  Copyright © 2016年 第七代目. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(int, SKFoePlaneType) {
    
    SKFoePlaneTypeBig = 1,
    SKFoePlaneTypeMedium = 2,
    SKFoePlaneTypeSmall = 3
};

@interface SKFoePlane : SKSpriteNode

@property (nonatomic,assign) int hp;
@property (nonatomic,assign) SKFoePlaneType type;


+ (instancetype)createBigPlane;

+ (instancetype)createMediumPlane;

+ (instancetype)createSmallPlane;

@end
