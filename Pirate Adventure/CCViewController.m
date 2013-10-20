//
//  CCViewController.m
//  Pirate Adventure
//
//  Created by Development on 10/14/13.
//  Copyright (c) 2013 Code Coalition. All rights reserved.
//

#import "CCViewController.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self startGame];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) startGame
{
    CCFactory *pirateAdventureFactory = [[CCFactory alloc] init];
    self.numberOfColumns = 4;
    self.numberOfRows = 3;
    self.pirateAdventure = [pirateAdventureFactory startGameWithColumns:4 AndRows:3];
    [self createStartingPoint];
    
    self.myCharacter = [pirateAdventureFactory createCharacter];
    [self updateCurrentTile];
}

// Create Starting Position -- TODO Make this Random
-(void)createStartingPoint
{
    self.currentPosition = CGPointMake(0,0);
    [self updateValidDirections];
}

// Get Current Tile
-(void)updateCurrentTile
{
    [self getTileByColumn:self.currentPosition.x andRow:self.currentPosition.y];
    self.storyLabel.text = self.currentTile.label;
    self.background.image = self.currentTile.background;
}

// Get Tile by Coordinates
-(void)getTileByColumn:(int)column andRow:(int)row
{
    // Check if Value is Valid
    if (column >= 0 && column < [self.pirateAdventure count]) {
        NSArray *columnArray = [self.pirateAdventure objectAtIndex:column];
        if (row >= 0 && row < [columnArray count] ) {
            self.currentTile = [[self.pirateAdventure objectAtIndex:column] objectAtIndex:row];
        }
    }
}

// Movement
// Reset Valid Directions
-(void)resetValidDirections
{
    self.buttonNorth.hidden = NO;
    self.buttonSouth.hidden = NO;
    self.buttonEast.hidden = NO;
    self.buttonWest.hidden = NO;
}

// Update Valid Directions
-(void)updateValidDirections
{
    [self resetValidDirections];
    
    // Hide West if x == 0
    if (self.currentPosition.x == (float)0) {
        self.buttonWest.hidden = YES;
    }
    
    // Hide East if x == # of Columns
    if (self.currentPosition.x == (float)self.numberOfColumns - 1)
    {
        self.buttonEast.hidden = YES;
    }
    
    // Hide South if y == 0
    if (self.currentPosition.y == (float)0) {
        self.buttonSouth.hidden = YES;
    }
    
    // Hide North if x == # of Rows
    if (self.currentPosition.y == (float)self.numberOfRows - 1)
    {
        self.buttonNorth.hidden = YES;
    }
}

// Move Character in a Direction
-(void)moveCharacterInX:(int)x andY:(int)y;
{
    // Add Validations
    self.currentPosition = CGPointMake(self.currentPosition.x + (float)x, self.currentPosition.y + (float)y);
    [self updateValidDirections];
    [self updateCurrentTile];
}


// Actions
- (IBAction)resetButtonPressed:(UIButton *)sender {
    [self startGame];
}

- (IBAction)buttonNorthPressed:(id)sender {
    [self moveCharacterInX:0 andY:1];
    
}
- (IBAction)buttonSouthPressed:(id)sender {
    [self moveCharacterInX:0 andY:-1];
}

- (IBAction)buttonWestPressed:(id)sender {
    [self moveCharacterInX:-1 andY:0];
}

- (IBAction)buttonEastPressed:(id)sender {
    [self moveCharacterInX:1 andY:0];
}

@end
