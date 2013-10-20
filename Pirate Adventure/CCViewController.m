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
    
    self.mainCharacter = [pirateAdventureFactory createCharacter];
    
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
    [self updateValidDirections];
    // Update Background
    self.background.image = self.currentTile.background;
    
    // Update Character
    self.healthNumber.text = [NSString stringWithFormat:@"%i",self.mainCharacter.health];
    self.damageNumber.text = [NSString stringWithFormat:@"%i",self.mainCharacter.weapon.damage];
    
    self.weaponName.text = self.mainCharacter.weapon.name;
    self.armorName.text = self.mainCharacter.armor.name;
    
    // Update Action
    if (self.currentTile.actionButtonName != nil)
    {
        [self.actionButtonName setTitle:self.currentTile.actionButtonName forState:UIControlStateNormal];
    }
    else
    {
        [self.actionButtonName setTitle:@"No Action" forState:UIControlStateNormal];
    }
    
    // Update Story
    self.storyLabel.text = self.currentTile.label;

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

    [self updateCurrentTile];
}

// Perform Action on Button
- (IBAction)actionButtonPressed:(id)sender {
    // Grab the Weapon
    if (self.currentTile.weapon != nil)
    {
        self.mainCharacter.weapon = self.currentTile.weapon;
        self.currentTile.actionButtonName = @"You took the weapon already!";
    }
    // Grab the Armor
    if (self.currentTile.armor != nil)
    {
        self.mainCharacter.armor = self.currentTile.armor;
        self.mainCharacter.health += self.currentTile.armor.health;
        self.currentTile.armor.health = 0;
        self.currentTile.actionButtonName = @"You took the armor already!";
    }
    if (self.currentTile.boss != nil)
    {
        // Update Character/Boss Health
        self.currentTile.boss.health -= self.mainCharacter.weapon.damage;
        self.mainCharacter.health -= self.currentTile.boss.damage;
        
        // Alert if Character's Health <= 0 (This will always trump boss's health)
        if (self.mainCharacter.health <= 0)
        {
            self.mainCharacter.health = 0; // Set to 0 so that we won't see a negative number in label
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died. Restart the game to try again!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
        }
        
        // Alert if Boss's Health <= 0
        if (self.currentTile.boss.health <= 0)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory" message:@"Congratulations. You have defeated ths boss! Restart the game to try again!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            
            [alertView show];
        }
    }
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
