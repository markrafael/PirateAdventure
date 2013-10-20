//
//  CCViewController.h
//  Pirate Adventure
//
//  Created by Development on 10/14/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCFactory.h"
#import "CCTile.h"

@interface CCViewController : UIViewController
@property (strong, nonatomic) NSArray *pirateAdventure;
@property (strong, nonatomic) CCCharacter *mainCharacter;

@property (nonatomic) CGPoint currentPosition;
@property (nonatomic) int numberOfColumns;
@property (nonatomic) int numberOfRows;

@property (nonatomic) CCTile *currentTile;
@property (strong, nonatomic) IBOutlet UIImageView *background;
@property (strong, nonatomic) IBOutlet UILabel *healthNumber;
@property (strong, nonatomic) IBOutlet UILabel *damageNumber;
@property (strong, nonatomic) IBOutlet UILabel *weaponName;
@property (strong, nonatomic) IBOutlet UILabel *armorName;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIButton *buttonNorth;
@property (strong, nonatomic) IBOutlet UIButton *buttonSouth;
@property (strong, nonatomic) IBOutlet UIButton *buttonWest;
@property (strong, nonatomic) IBOutlet UIButton *buttonEast;
@property (strong, nonatomic) IBOutlet UIButton *actionButtonName;


- (void)createStartingPoint;
- (void)updateCurrentTile;
- (void)getTileByColumn:(int)column andRow:(int)row;
- (void)updateValidDirections;
- (void)moveCharacterInX:(int)x andY:(int)y;

- (IBAction)actionButtonPressed:(id)sender;
- (IBAction)buttonNorthPressed:(id)sender;
- (IBAction)buttonSouthPressed:(id)sender;
- (IBAction)buttonWestPressed:(id)sender;
- (IBAction)buttonEastPressed:(id)sender;

-(IBAction)resetButtonPressed:(UIButton *)sender;


@end
