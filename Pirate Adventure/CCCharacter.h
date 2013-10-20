//
//  CCCharacter.h
//  Pirate Adventure
//
//  Created by Development on 10/20/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWeapon.h"
#import "CCArmor.h"

@interface CCCharacter : NSObject
@property (strong, nonatomic) CCWeapon *weapon;
@property (strong, nonatomic) CCArmor *armor;
@property (nonatomic) int health;
@end
