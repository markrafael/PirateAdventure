//
//  CCFactory.h
//  Pirate Adventure
//
//  Created by Development on 10/14/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCharacter.h"

@interface CCFactory : NSObject

@property (nonatomic) int numberOfColumns;
@property (nonatomic) int numberOfRows;

-(NSArray *)startGameWithColumns:(int)columns AndRows:(int)rows;
-(CCCharacter *)createCharacter;
@end
