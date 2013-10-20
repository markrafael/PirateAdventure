//
//  CCTile.h
//  Pirate Adventure
//
//  Created by Development on 10/14/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWeapon.h"
#import "CCArmor.h"
#import "CCBoss.h"

@interface CCTile : NSObject
@property (strong, nonatomic) UIImage *background;
@property (strong, nonatomic) NSString *label;
@property (strong, nonatomic) CCWeapon *weapon;
@property (strong, nonatomic) CCArmor *armor;
@property (strong, nonatomic) CCBoss *boss;
@property (strong, nonatomic) NSString *actionButtonName;
@end
