//
//  CCFactory.m
//  Pirate Adventure
//
//  Created by Development on 10/14/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import "CCFactory.h"
#import "CCTile.h"

@implementation CCFactory

// Start a New Game
-(NSArray *)startGameWithColumns:(int)columns AndRows:(int)rows {
    // Create Tile Objects -- Can't just repeat tile1,tile2,tile3 as these share the same memory address
    CCTile *tile1 = [[CCTile alloc] init];
    tile1.label = @"Tile 1";
    tile1.background = [UIImage imageNamed:@"PirateAttack.jpg"];
    
    CCTile *tile2 = [[CCTile alloc] init];
    tile2.label = @"Tile 2";
    tile2.background = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    
    CCTile *tile3 = [[CCTile alloc] init];
    tile3.label = @"Tile 3";
    tile3.background = [UIImage imageNamed:@"PirateBoss.jpeg"];
    
    CCTile *tile4 = [[CCTile alloc] init];
    tile4.label = @"Tile 4";
    tile4.background = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    
    CCTile *tile5 = [[CCTile alloc] init];
    tile5.label = @"Tile 5";
    tile5.background = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    
    CCTile *tile6 = [[CCTile alloc] init];
    tile6.label = @"Tile 6";
    tile6.background = [UIImage imageNamed:@"PirateParrot.jpg"];
    
    CCTile *tile7 = [[CCTile alloc] init];
    tile7.label = @"Tile 7";
    tile7.background = [UIImage imageNamed:@"PiratePlank.jpg"];
    
    CCTile *tile8 = [[CCTile alloc] init];
    tile8.label = @"Tile 8";
    tile8.background = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    
    CCTile *tile9 = [[CCTile alloc] init];
    tile9.label = @"Tile 9";
    tile9.background = [UIImage imageNamed:@"PirateStart.jpg"];
    
    CCTile *tile10 = [[CCTile alloc] init];
    tile10.label = @"Tile 10";
    tile10.background = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    
    CCTile *tile11 = [[CCTile alloc] init];
    tile11.label = @"Tile 11";
    tile11.background = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    
    CCTile *tile12 = [[CCTile alloc] init];
    tile12.label = @"Tile 12";
    tile12.background = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    
    // Create Columns
    NSArray *column1Array = [[NSArray alloc]initWithObjects:tile1, tile2, tile3, nil];
    NSArray *column2Array = [[NSArray alloc]initWithObjects:tile4, tile5, tile6, nil];
    NSArray *column3Array = [[NSArray alloc]initWithObjects:tile7, tile8, tile9, nil];
    NSArray *column4Array = [[NSArray alloc]initWithObjects:tile10, tile11, tile12, nil];

    // Create Array to Hold Columns
    return [[NSArray alloc] initWithObjects:column1Array, column2Array, column3Array, column4Array, nil];
}

-(CCCharacter *)createCharacter {
    CCCharacter *character = [[CCCharacter alloc] init];
    
    CCWeapon *weapon = [[CCWeapon alloc] init];
    weapon.name = @"Rusty Sword";
    weapon.damage = 10;
    
    CCArmor *armor = [[CCArmor alloc] init];
    armor.name = @"Leather Armor";
    armor.health = 100;
    
    character.armor = armor;
    character.weapon = weapon;
    
    return character;
}

@end